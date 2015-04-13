class CreateFavouriteUsers < ActiveRecord::Migration
  def change
    create_table :favourite_users do |t|

      t.timestamps null: false
    end
  end
end
