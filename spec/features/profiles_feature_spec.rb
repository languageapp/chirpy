require 'rails_helper'

context 'creating a profile' do

  before do
    visit('/')
    click_link('uk')
    expect(page).to have_content 'Sign up'
    fill_in("user_email", with: 'test1@example.com')
    fill_in('user_password', with: 'testtest')
    fill_in('user_password_confirmation', with: 'testtest')
    find(".btn").click
  end

  it 'the form has a name, age, bio, image and gender field' do
    expect(page).to have_css('#profile_name')
    expect(page).to have_css('#profile_age')
    expect(page).to have_css('input[type="file"]')
    expect(page).to have_css('#profile_bio')
    expect(page).to have_css('#profile_gender')
  end
end

context 'a profile has been created' do

  before do 
    user = create(:user)
    login_as(user, :scope => :user) 
    profile = create(:profile, user: user)
    language = create(:language, user: user)
    visit '/'
  end  

  it 'should display the users profile' do
    expect(page).to have_content 'Kev'
    expect(page).to have_content '21'
    expect(page).to have_content 'Please teach me Swedish!'
    expect(page).to have_content 'Male'
  end

  it 'a profile can be updated' do
    click_link('Edit your profile')
    fill_in('profile_name', with: 'Joe')
    click_button('Update profile')
    expect(page).to have_content 'Joe'
  end
 
  scenario 'view other peoples profiles' do 
    joe = create(:user, email: 'joe@joe.com', password: 'testtest')
    joes_profile = create(:profile, user: joe, name: 'Joe', age: '21', bio: 'I want learn English', gender: 'Male')
    language = create(:language, user: joe)
    visit '/'
    expect(page).to have_content 'Joe'
  end

  scenario 'view other peoples profiles on the main profile screen' do 
    joe = create(:user, email: 'joe@joe.com', password: 'testtest')
    joes_profile = create(:profile, user: joe, name: 'Joe', age: '21', bio: 'I want learn English', gender: 'Male')
    language = create(:language, user: joe)
    visit '/'
    click_link('View profile', match: :first)
    expect(page).to have_content 'Return to your profile'
  end

  scenario 'click my profile to view my profile' do 
    joe = create(:user, email: 'joe@joe.com', password: 'testtest')
    joes_profile = create(:profile, user: joe, name: 'Joe', age: '21', bio: 'I want learn English', gender: 'Male')
    language = create(:language, user: joe)
    visit '/'
    click_link('View profile', match: :first)
    click_link('My profile')
    expect(page).to have_content 'Edit your profile'
  end

end