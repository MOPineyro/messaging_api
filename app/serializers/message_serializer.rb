class MessageSerializer < ActiveModel::Serializer
  attributes :sender_id, :sender_email, :conversation_id, :body, :created_at

  belongs_to :conversation

  def sender_email
    sender_email = User.find(object.sender_id)
    "#{sender_email.email}"
  end
end