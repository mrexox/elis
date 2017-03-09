class AddForiegnKeyToPostsTags < ActiveRecord::Migration[5.0]
  def up
		add_foreign_key('pots_tags', 'tags', :column => 'tag_id', :primary_key => 'tag_id')
  end

	def down
		remove_foreign_key('posts_tags', 'tag_id')
	end
end
