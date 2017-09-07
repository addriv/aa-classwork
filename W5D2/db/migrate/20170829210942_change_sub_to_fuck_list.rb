class ChangeSubToFuckList < ActiveRecord::Migration[5.1]
  def change
    rename_table :subs, :fuck_lists
    rename_table :posts, :fucks
    rename_column :fucks, :fuck_lists_id, :fuck_list_id
  end
end
