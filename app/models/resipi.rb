class Resipi < ActiveRecord::Base
	#has_attached_file :image
	#attr_accessor :image
	#validates_attachment_content_type :image, :content_type => /\Aimage/
	#validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]
	validates :title, 	presence: true, length: { minimum: 5 }
end
