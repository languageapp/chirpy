require 'rails_helper'

describe Language, :type => :model do

  it { is_expected.to belong_to :user }

end