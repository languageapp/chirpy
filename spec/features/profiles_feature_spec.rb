require 'rails_helper'

def sign_up
  visit('/')
  click_link('uk')
  expect(page).to have_content 'Sign up'
  fill_in("user_email", with: 'test1@example.com')
  fill_in('user_password', with: 'testtest')
  fill_in('user_password_confirmation', with: 'testtest')
  find(".btn").click
end

def create_profile
  fill_in('profile_name', with: 'Kev')
  select('21', from: 'profile_age')
  fill_in('profile_bio', with: 'Please teach me Swedish!')
  select('Male', from: 'profile[gender]')
  select('French', from: 'language_language_target')
  select('Beginner', from: 'language_proficiency')
  find(".btn").click
end

context 'creating a profile' do

  it 'the form has a name, age, bio, image and gender field' do
    sign_up
    expect(page).to have_css('#profile_name')
    expect(page).to have_css('#profile_age')
    expect(page).to have_css('input[type="file"]')
    expect(page).to have_css('#profile_bio')
    expect(page).to have_css('#profile_gender')
  end
end

context 'a profile has been created' do

  it 'should display the users profile' do
    sign_up
    create_profile
    save_and_open_page
    expect(page).to have_content 'Kev'
    expect(page).to have_content '21'
    expect(page).to have_content 'Please teach me Swedish!'
    expect(page).to have_content 'Male'
  end

  it 'a profile can be updated' do
    sign_up
    create_profile
    click_link('edit your profile')
    fill_in('profile_name', with: 'Joe')
    click_button('Update Profile')
    expect(page).to have_content 'Joe'
    expect(current_path).to eq '/profiles/2'
  end
end