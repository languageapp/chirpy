class Language < ActiveRecord::Base

  belongs_to :user

   class << self
    def proficiencies()
      proficiencies = {
        '1' => 'Beginner',
        '2' => 'Average',
        '3' => 'Fluent'
      }
    end
  end


end
