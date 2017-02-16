class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  scope :sorted, lambda { order('created_at DESC') }
end
