class EditMessagesToReferToSenderId < ActiveRecord::Migration[5.1]
  def change
    rename_column :messages, :user_id, :sender_id
    remove_column :messages, :user_email, :string
  end
end
