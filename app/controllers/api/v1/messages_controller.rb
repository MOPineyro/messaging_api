class Api::V1::MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user
  before_action :find_conversation

  # GET /messages
  def index
    @messages = @conversation.messages.order(:created_at)
    render json: @messages
  end

  def create
    @message = @conversation.messages.new(user_id: current_user.id, body: params[:body], conversation_id: params[:conversation_id], user_email: current_user.email)
    if @messages.save
      render json: { status: 'Message Sent' }, status: :ok
    else
      render json: { status: 'Message Failed to Send' }, status: :bad_request
    end
  end


  private
    def find_conversation
      @conversation = Conversation.find(params[:conversation_id])
      user_in_conversation?
    end

    def user_in_conversation?
      if not (current_user.id == @conversation.sender_id or current_user.id == @conversation.receiver_id)
        render json: { error: "Invalid user!", status: :bad_request }, status: :bad_request
      end
    end

    # Only allow a trusted parameter "white list" through.
    # def message_params
    #   params.require(:message).permit(:body, :user_id, :user_email)
    # end
end
