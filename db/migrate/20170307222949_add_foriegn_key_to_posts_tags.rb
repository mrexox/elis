class AddForiegnKeyToPostsTags < ActiveRecord::Migration[5.0]
  def up
		add_foreign_key('tags', 'posts_tags')
  end
	def down
		remove_foreign_key('posts_tags', 'tag_id', :column => 'tag_id')
	end
end
