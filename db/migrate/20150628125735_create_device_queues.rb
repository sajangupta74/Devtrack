class CreateDeviceQueues < ActiveRecord::Migration
  def change
    create_table :device_queues do |t|
      t.integer :device_id
      t.integer :user_id
      t.timestamp :time
      t.timestamp :return_time

      t.timestamps
    end
  end
end
