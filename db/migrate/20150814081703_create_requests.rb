class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :sender_id
      t.integer :reciever_id
      t.integer :status_id
      t.integer :device_id

      t.timestamps
    end
  end
end
