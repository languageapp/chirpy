FactoryGirl.define do
  factory :user do |u|
    u.email 'test@test.com'
    u.password 'testing1234'
    u.profile {|u| u.association(:profile)}
  end

  factory :profile do
    name 'kev'
    age '24'

  end
end
