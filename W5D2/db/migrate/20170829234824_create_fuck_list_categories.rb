class CreateFuckListCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :fuck_list_categories do |t|
      t.integer :fuck_id, null: false
      t.integer :fuck_list_id, null: false

      t.timestamps
    end
    add_index :fuck_list_categories, :fuck_id
    add_index :fuck_list_categories, :fuck_list_id
  end
end
