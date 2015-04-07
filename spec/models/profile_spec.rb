require 'rails_helper'

describe Profile, :type => :model do

  it { is_expected.to belong_to :user }

end