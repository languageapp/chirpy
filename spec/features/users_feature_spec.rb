require 'rails_helper'

context 'user not signed up and lands on home page' do

  it 'should expect to see content "Welcome! What\'s your native language"' do
    visit('/')
    expect(page).to have_content 'Welcome! What\'s your native language'
  end

  it 'should see a "Log in" link' do
    visit('/')
    click_link('Log in')
    expect(page).to have_css('input[type="email"]')
    expect(page).to have_css('input[type="password"]')
    expect(page).to have_button('Sign in')
  end

  it 'should not see "sign out" link' do
    visit('/')
    click_link('Log in')
    expect(page).not_to have_link('Sign out')
  end
end

context 'user\'s native language' do

  it 'should be be able to learn English' do
    visit('/')
    click_link('uk')
    expect(current_path).to eq '/en/users/sign_up'
  end

  it 'should be be able to learn Spanish' do
    visit('/')
    click_link('es')
    expect(current_path).to eq '/es/users/sign_up'
  end

  it 'should be be able to learn German' do
    visit('/')
    click_link('de')
    expect(current_path).to eq '/de/users/sign_up'
  end

  it 'should be be able to learn French' do
    visit('/')
    click_link('fr')
    expect(current_path).to eq '/fr/users/sign_up'
  end

  it 'should be be able to learn Italian' do
    visit('/')
    click_link('it')
    expect(current_path).to eq '/it/users/sign_up'
  end
end

context 'user signed up and on the create profile page' do

  before do
    visit('/')
    click_link('uk')
    expect(page).to have_content 'Sign up'
    fill_in("user_email", with: 'test1@example.com')
    fill_in('user_password', with: 'testtest')
    fill_in('user_password_confirmation', with: 'testtest')
    find(".btn").click
  end

  it 'should see "Enter details"' do
    visit('/profiles')
    expect(page).to have_content 'Enter details'
  end

  it 'should not see a "sign in" link and a "sign up" link' do
    visit('/profiles')
    expect(page).not_to have_link('Log in')
    expect(page).not_to have_link('Sign up')
  end

    

end