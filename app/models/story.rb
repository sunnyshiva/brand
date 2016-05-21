class Story < ActiveRecord::Base
	belongs_to :user
	belongs_to :category

	has_attached_file :story_img, styles: { story_index: "250x350>", story_show: "325x475>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :story_img, content_type: /\Aimage\/.*\Z/
end
