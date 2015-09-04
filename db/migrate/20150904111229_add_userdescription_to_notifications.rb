class AddUserdescriptionToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :userdescription, :string
  end
end
