class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
	has_and_belongs_to_many :posts

end
