class DropFuckId < ActiveRecord::Migration[5.1]
  def change
    remove_column :fucks, :fuck_list_id
  end
end
