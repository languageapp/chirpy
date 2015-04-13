require 'rails_helper'

context 'starting a chat' do

  it 'should open a chatbox' do
    sign_up
    create_profile
    click_button('Message')
    # expect(page).to have_content 'Joe'
    # expect(current_path).to eq '/profiles/2'
  end
end