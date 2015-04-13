require 'rails_helper'

context 'starting a chat' do

  it 'should open a chatbox' do
    sign_up
    create_profile
    click_link('Message')
    expect(page).to have_css('#chatbox_2')
    # expect(current_path).to eq '/profiles/2'
  end
end
