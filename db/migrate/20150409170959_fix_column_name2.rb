class FixColumnName2 < ActiveRecord::Migration
 def change
    rename_column :languages, :language_name, :language_native
  end
end
