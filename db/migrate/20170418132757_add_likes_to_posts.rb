class AddLikesToPosts < ActiveRecord::Migration[5.0]
  def up
    add_column :posts, :likes, :integer, :default => 0
  end

	def down
		remove_column :posts, :likes
	end
end
