class ChangeProficiencyDatatype < ActiveRecord::Migration
 def up
    change_column :languages, :proficiency, :string
  end

  def down
    change_column :languages, :proficiency, :integer
  end
end