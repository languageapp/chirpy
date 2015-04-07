require 'rails_helper'

context 'user not signed in and lands on home page' do 

  it 'should display flags' do 
    visit '/'
    expect(page).to have_css('intro_flags')
  end  

end  