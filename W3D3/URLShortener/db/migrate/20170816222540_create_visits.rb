class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.integer :user_id, null: false
      t.string :short_url_id, null: false
      t.timestamps
    end
    add_index :visits, :user_id, unique: true
    add_index :visits, :short_url_id, unique: true
  end
end
