class CreateDeviceQueues < ActiveRecord::Migration
  def change
    create_table :device_queues do |t|
      t.integer :device_id
      t.integer :user_id
      t.integer :status_id

      t.timestamps
    end
  end
end
