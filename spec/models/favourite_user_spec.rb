require 'rails_helper'

describe FavouriteUser, :type => :model do

  it { is_expected.to belong_to :user }

end