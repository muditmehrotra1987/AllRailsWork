class CreateInvits < ActiveRecord::Migration
  def change
    create_table :invits do |t|
      t.integer :sender_id
      t.string :recipient_email
      t.string :token
      t.datetime :sent_at

      t.timestamps
    end
  end
end
