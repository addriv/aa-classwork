class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.text :content
      t.integer :user_id, null: false
      t.integer :fuck_lists_id, null: false

      t.timestamps
    end

    add_index :posts, :user_id
    add_index :posts, :fuck_lists_id
  end
end
