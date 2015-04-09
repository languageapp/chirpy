class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :languages, :language, :language_name
  end
end
