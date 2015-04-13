class AddUserIdToFavouriteUsers < ActiveRecord::Migration
  def change
    add_reference :favourite_users, :user, index: true, foreign_key: true
  end
end
