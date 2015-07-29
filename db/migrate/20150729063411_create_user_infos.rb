class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.binary :image, :limit => 10.megabyte
      t.string :department
      t.string :designation

      t.timestamps
    end
  end
end
