require 'rails_helper'

describe Conversation, :type => :model do

  it { is_expected.to have_many :messages }
  it { is_expected.to belong_to :sender }
  it { is_expected.to belong_to :recipient }

end