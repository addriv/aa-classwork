class ChangeFuckTitle < ActiveRecord::Migration[5.1]
  def change
    rename_column :fucks, :title, :name
  end
end
