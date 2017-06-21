class Conversation < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :receiver, foreign_key: :receiver_id, class_name: 'User'

  has_many :messages, dependent: :destroy

  validates_uniqueness_of :sender_id, scope: :receiver_id
  validates_uniqueness_of :receiver_id, scope: :sender_id

  scope :between, -> (sender_id, receiver_id) do 
    Conversation.where(receiver_id: sender_id, sender_id: receiver_id).or(Conversation.where(sender_id: sender_id, receiver_id: receiver_id))
  end
  
end
