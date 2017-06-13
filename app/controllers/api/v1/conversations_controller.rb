class Api::V1::ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user

  def index
    @users_email = User.all
    render json: @users_email
  end

  def create
    sender_id = current_user.id
    receiver_id = User.where(email: params[:conversation][:receiver_email])[0][:id]
    if Conversation.between(sender_id, receiver_id).present?
      @conversation = Conversation.between(sender_id, receiver_id).first
    else
      @conversation = Conversation.create!(sender_id: sender_id, receiver_id: receiver_id)
    end

    render json: { message: 'Conversation created', 'id': @conversation.id }
  end
end