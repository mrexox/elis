class Post < ApplicationRecord

	has_and_belongs_to_many :tags
	has_and_belongs_to_many :images
	
	mount_uploaders :images, ImageUploader
	serialize :images, JSON # remove in production (non-SQLite3)

  scope :sorted, lambda { order('created_at DESC') }

  validates :permalink, :presence => true,
    :uniqueness => true
end
