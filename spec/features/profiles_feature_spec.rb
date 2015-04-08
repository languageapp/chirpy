require 'rails_helper'

context 'creating a profile' do 
  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  it 'the form has a name, bio, image and gender field' do 
    visit('/')
    expect(page).to have_css('input[name="name"]')
    expect(page).to have_css('input[type="file"]')
    expect(page).to have_css('input[name="bio"]')
    expect(page).to have_css('input[name="gender"]')
  end  
end  