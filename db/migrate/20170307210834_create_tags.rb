class CreateTags < ActiveRecord::Migration[5.0]
  def up
    create_table :tags do |t|
      t.string 'tag_name', :null => false
    end
  end

	def down
		drop_table :tags
	end
end
