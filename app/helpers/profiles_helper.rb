module ProfilesHelper

@languagesArray = ['English', 'French', 'German', 'Italian', 'Spanish']

  def format_language(lang)
    case lang
      when 'de', 'German'
        'Germany'
      when 'en', 'English'
        'United-Kingdom'
      when 'es', 'Spanish'
        'Spain'
      when 'sv', 'Swedish'
        "Sweden"
      when 'db', 'Norwegian'
        "Norway"
      when 'fr', 'French'
        "France"
      when 'it', 'Italian'
        "Italy"
    else
      "missing"
    end
  end
end