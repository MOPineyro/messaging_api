class Message < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :conversation
  validates_presence_of :sender_id, :conversation_id, :body
end
