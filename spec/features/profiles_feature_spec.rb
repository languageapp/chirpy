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

  it 'should display the users profile' do
    user = create(:user, id: 1)
    login_as(user, :scope => :user) 
    profile = create(:profile, user: user)
    language = create(:language, user: user)
    visit '/'
    expect(page).to have_content 'Kev'
    expect(page).to have_content '21'
    expect(page).to have_content 'Please teach me Swedish!'
    expect(page).to have_content 'Male'
  end

  it 'a profile can be updated' do
    user = create(:user, id: 2)
    login_as(user, :scope => :user) 
    profile = create(:profile, user: user)
    language = create(:language, user: user)
    visit '/'
    click_link('Edit your profile')
    fill_in('profile_name', with: 'Joe')
    click_button('Update profile')
    expect(page).to have_content 'Joe'
  end
end