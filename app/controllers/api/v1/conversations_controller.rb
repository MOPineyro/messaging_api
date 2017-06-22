class Api::V1::ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user

  def index
    @conversations = Conversation.where(receiver_id: current_user.id).or(Conversation.where(sender_id: current_user.id)).includes(:messages)
    paginate json: @conversations, per_page: 20
  end

  def create
    sender_id = current_user.id
    receiver_id = User.where(email: params[:conversation][:receiver_email])[0][:id]
    if Conversation.between(sender_id, receiver_id).present?
      @conversation = Conversation.between(sender_id, receiver_id).first

      render json: @conversation, status: :ok
    else
      @conversation = Conversation.create!(sender_id: sender_id, receiver_id: receiver_id)

      render json: @conversation, status: :created
    end
  end
end