class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :post
      t.string :post_image
      t.integer :user_id

      t.timestamps
    end
  end
end
