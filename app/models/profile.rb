class Profile < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "logo.png"
  
  :s3_host_name => 'chirpy.s3.amazonaws.com'
  :path => ':filename'

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
end
