class Post < ApplicationRecord

	has_and_belongs_to_many :tags
	has_many :likes
	
	mount_uploaders :images, ImageUploader
	serialize :images, JSON
  scope :sorted, lambda { order('created_at DESC') }

  validates :permalink, :presence => true,
    :uniqueness => true
end
