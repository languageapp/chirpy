class Language < ActiveRecord::Base

  belongs_to :user

 def translated_language
    I18n.t(name, :scope => 'role')
  end


  def format_from_locale(lang)
    case lang
      when 'de'
        'German'
      when 'en'
        'English'
      when 'es'
        'Spanish'
      when 'fr'
        'French'
      when 'it'
        'Italian'
    else
      "missing"
    end
  end


  def format_to_locale(lang)
    case lang
      when 'German'
        'de'
      when 'English'
        'en'
      when 'Spanish'
        'es'
      when 'French'
        'fr'
      when 'Italian'
        'it'
    end
  end

  def get_array
    langArray = {I18n.t('profiles.form.English', :default => 'English') => 'English',
                I18n.t('profiles.form.French', :default => 'French') => 'French',
                I18n.t('profiles.form.German', :default => 'German') => 'German',
                I18n.t('profiles.form.Italian', :default => 'Italian') => 'Italian',
                I18n.t('profiles.form.Spanish', :default => 'Spanish') => 'Spanish'}
  end
end