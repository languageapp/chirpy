require 'rails_helper'

describe Message, :type => :model do

  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :conversation }

end