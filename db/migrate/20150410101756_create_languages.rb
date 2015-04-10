class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
     t.string :language_native
        t.string :language_target
      t.integer :proficiency
      t.timestamps null: false
      # add_reference :languages, :user, index: true, foreign_key: true
    end
  end
end
