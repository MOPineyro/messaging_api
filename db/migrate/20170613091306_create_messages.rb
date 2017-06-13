class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.integer :sender_id
      t.integer :receiver_id

      t.timestamps
    end

    create_table :messages do |t|
      t.text :body
      t.references :conversation, index: true
      t.references :user, index: true
      t.string :user_email

      t.timestamps
    end
  end
end
