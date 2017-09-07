class DropVisits2 < ActiveRecord::Migration[5.1]
  def change
    drop_table :visits
    create_table :visits do |t|
      t.integer :user_id, null: false
      t.integer :short_url_id, null: false
      t.timestamps
    end
    add_index :visits, :user_id, unique: false
    add_index :visits, :short_url_id, unique: false
  end
end
