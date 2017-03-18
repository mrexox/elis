class ChangeImageInPostsToImages < ActiveRecord::Migration[5.0]
  def up
		remove_column(:posts, 'image')
		add_column(:posts, 'images', :string)
  end

	def down
		remove_column(:posts, 'images')
		add_column(:posts, 'image', :string)
	end
end
