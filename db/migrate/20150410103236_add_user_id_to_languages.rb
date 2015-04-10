class AddUserIdToLanguages < ActiveRecord::Migration
  def change
    add_reference :languages, :user, index: true, foreign_key: true
  end
end
