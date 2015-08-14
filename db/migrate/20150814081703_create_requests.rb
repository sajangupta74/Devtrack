class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :sender_id
      t.integer :reciever_id
      t.boolean :is_success
      t.boolean :is_reject
      t.boolean :is_on_hold
      t.integer :device_id

      t.timestamps
    end
  end
end
