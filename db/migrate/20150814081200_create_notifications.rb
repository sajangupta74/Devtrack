class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :sender_id
      t.string  :description
      t.integer :activity_id
      t.integer :request_id

      t.timestamps
    end
  end
end
