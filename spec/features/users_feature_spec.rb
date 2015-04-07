require 'rails_helper'

context 'user not signed in and lands on home page' do

  it 'should display flags' do
    visit '/'
    expect(page).to have_css('.english_flag')
    expect(page).to have_css('.spanish_flag')
  end

  it 'should see a "login" form and a "sign up" link' do
    visit('/')
    click_link('english_flag')
    expect(page).to have_css('input[type="email"]')
    expect(page).to have_link('Sign up')
  end

  it 'should not see "sign out" link' do
    visit('/')
    click_link('english_flag')
    expect(page).not_to have_link('Sign out')
  end

# context 'user signed in on the profile page' do

#   before do
#     visit('/users/sign_in')
#     click_link('Sign up')
#     fill_in('Email', with: 'test@example.com')
#     fill_in('Password', with: 'testtest')
#     fill_in('Password confirmation', with: 'testtest')
#     click_button('Sign up')
#   end
# end

#   it 'should see "sign out" link' do
#     visit('/users/sign_in')
#     expect(page).to have_link('Sign out')
#   end

#   it 'should not see a "sign in" link and a "sign up" link' do
#     visit('/users/sign_in')
#     expect(page).not_to have_link('Sign in')
#     expect(page).not_to have_link('Sign up')
#   end
end