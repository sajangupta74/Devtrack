class AddOwnerToDevices < ActiveRecord::Migration
  def change
  	add_column :devices, :owner, :integer 
  end
end
