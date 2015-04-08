require 'rails_helper'

describe Profile, :type => :model do

  it { is_expected.to belong_to :user }
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:image_file_name) }
  it { should have_db_column(:bio).of_type(:text) }
  it { should have_db_column(:age).of_type(:integer) }
  it { should have_db_column(:gender).of_type(:string) }

end