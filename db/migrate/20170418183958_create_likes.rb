class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.string :user_ip
      t.references :post, foreign_key: true

      t.timestamps
    end
		remove_column :posts, :likes
  end
end
