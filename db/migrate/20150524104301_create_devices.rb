class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.string :device_type
      t.string :slug
      t.integer :status_id

      t.timestamps
    end
  end
end
