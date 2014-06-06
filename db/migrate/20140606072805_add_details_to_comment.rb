class AddDetailsToComment < ActiveRecord::Migration
  def change
    add_column :comments, :description, :string
  end
end
