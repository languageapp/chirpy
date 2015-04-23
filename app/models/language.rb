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
end