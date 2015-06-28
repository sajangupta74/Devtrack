class AddTimeToDeviceTable < ActiveRecord::Migration
  def change
    add_column :devices, :time, :integer
  end
end
