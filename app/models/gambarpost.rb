class Gambarpost < ApplicationRecord
  belongs_to :post 
  has_attached_file :picture, styles: { large:"600x600#",medium: "400x400#", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  validates_attachment :picture, presence: true
  do_not_validate_attachment_file_type :picture
 


 def url 
 	 picture.url(:thumb)
 end
end