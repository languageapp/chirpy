require 'rails_helper'

context 'user not signed in and lands on home page' do

  it 'should be be able to choose a language to learn' do
    visit('/')
    click_link('Norway')
    expect(page).to have_css('input[type="email"]')
  end

  it 'should see a "login" form and a "sign up" link' do
    visit('/')
    click_link('Sign up')
    expect(page).to have_css('input[type="email"]')
    expect(page).to have_button('Sign up')
  end

  it 'should see a "login" form and a "sign up" link' do
    visit('/')
    click_link('Log in')
    expect(page).to have_css('input[type="email"]')
    expect(page).to have_button('Log in')
  end

  it 'should not see "sign out" link' do
    visit('/')
    click_link('Log in')
    expect(page).not_to have_link('Sign out')
  end
end
context 'user signed in on the profile page' do

  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  it 'should see "sign out" link' do
    visit('/')
    expect(page).to have_link('Sign out')
  end

  it 'should not see a "sign in" link and a "sign up" link' do
    visit('/')
    expect(page).not_to have_link('Log in')
    expect(page).not_to have_link('Sign up')
  end
end