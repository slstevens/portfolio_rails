class Project < ActiveRecord::Base

	has_many :comments, dependent: :destroy
	validates :title, length: {minimum: 5}

	has_many :project_images, dependent: :destroy

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	geocoded_by :address
	after_validation :geocode, :if => :address_changed?
	belongs_to :user


	reverse_geocoded_by :latitude, :longitude do |obj,results|
		if geo = results.first
			obj.city    = geo.city
			obj.postal_code = geo.postal_code
		end
	end
	after_validation :reverse_geocode
end
