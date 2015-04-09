class AddLanguageTargetToLanguages < ActiveRecord::Migration
  def change
    add_column :languages, :language_target, :string
  end
end
