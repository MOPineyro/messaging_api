class MessageSerializer < ActiveModel::Serializer
  attributes :user_id, :user_email, :conversation_id, :body, :created_at

  belongs_to :conversation
end