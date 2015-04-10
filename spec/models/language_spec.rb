require 'rails_helper'

describe Language, :type => :model do

 it { is_expected.to belong_to :user }
 it { should have_db_column(:proficiency).of_type(:integer) }
 it { should have_db_column(:user_id).of_type(:integer) }
 it { should have_db_column(:language_target).of_type(:string) }
 it { should have_db_column(:language_native).of_type(:string) }

end