class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :created_at

  has_many :messages
end