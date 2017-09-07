class ChangeFuckUrl < ActiveRecord::Migration[5.1]
  def change
    rename_column :fucks, :url, :img_url
  end
end
