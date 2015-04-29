class Profile < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "logo.png"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user

  def proficiencies_array
    @proficiencyArray = {I18n.t('profiles.form.Beginner', :default => 'Beginner') => 'Beginner',
                        I18n.t('profiles.form.Average', :default => 'Average') => 'Average',
                        I18n.t('profiles.form.Fluent', :default => 'Fluent') => 'Fluent'}
  end
end
