class Message < ApplicationRecord
  scope :sorted, lambda { order("created_at DESC")}

  validates :text, :presence => true
  
  validates :theme, :presence => true

  validates :email, :presence => true
  
  validates :name, :presence => true
end
