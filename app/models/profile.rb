class Profile < ActiveRecord::Base

	belongs_to :user

	geocoded_by :address
	after_validation :geocode, :if => :address_changed?
	
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
end
