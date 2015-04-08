require 'rails_helper'

def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def create_profile
  fill_in('Name', with: 'Kev')
  fill_in('Age', with: '21')
  attach_file 'Image', 'spec/british_flag.png'
  fill_in('Bio', with: 'Please teach me Swedish!')
  select('Male', from: 'profile[gender]')
  click_button('Create Profile')
end

context 'creating a profile' do

  it 'the form has a name, age, bio, image and gender field' do
    sign_up
    visit('/')
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
    visit('/')
    create_profile
    expect(page).to have_content 'Kev'
    expect(page).to have_content '21'
    expect(page).to have_css("img[src*='british_flag.png']")
    expect(page).to have_content 'Please teach me Swedish!'
    expect(page).to have_content 'Male'
  end
end
