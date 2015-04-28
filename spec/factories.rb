FactoryGirl.define do
  factory :user do |u|
    u.email 'test@test.com'
    u.password 'testing1234'
  end
  factory :profile do |profile|
    profile.name 'Kev'
    profile.age '21'
    profile.bio 'Please teach me Swedish!'
    profile.gender 'Male'
  end
  factory :language do |lang|
    lang.language_native 'English'
    lang.language_target 'French'
    lang.proficiency 'Beginner'
  end  
end
