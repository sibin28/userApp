class AddTagToPost < ActiveRecord::Migration
  def change
    add_column :posts, :tab, :boolean
  end
end
