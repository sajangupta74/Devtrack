class AddUserIdStatusIdToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :user_id, :integer
    add_column :devices, :status_id, :integer
  end
end
