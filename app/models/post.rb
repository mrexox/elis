class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

	has_and_belongs_to_many :tags

  scope :sorted, lambda { order('created_at DESC') }

  validates :permalink, :presence => true,
    :uniqueness => true

end
