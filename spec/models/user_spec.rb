require 'rails_helper'

describe User, :type => :model do

  it { is_expected.to have_one :profile }
  it { is_expected.to have_many :languages }
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:image_file_name) }
  it { should have_db_column(:encrypted_password).of_type(:string) }
  it { should have_db_column(:profile_id).of_type(:integer) }
  it { should have_db_column(:image_content_type).of_type(:string) }

end