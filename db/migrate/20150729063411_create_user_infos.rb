class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.integer :user_id
      t.string  :first_name
      t.string  :last_name
      t.date    :dob
      t.binary  :image, :limit => 10.megabyte
      t.string  :image_name
      t.string  :department
      t.string  :designation
      t.integer :phone, limit: 8
      t.string  :gender
      t.string  :city
      t.integer :zipcode

      t.timestamps
    end
  end
end
