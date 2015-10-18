class AddSeenOpenToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :seen, :boolean
    add_column :notifications, :open, :boolean
  end
end
