class Tag < ApplicationRecord
	has_and_belongs_to_many :posts, :dependent => :delete_all

	before_validation { |tag| tag.tag_name = tag.tag_name.downcase }

  scope :sorted, lambda { order('tag_name ASC') }
	
	
	validates :tag_name, :uniqueness => true,
		:presence => true
end
