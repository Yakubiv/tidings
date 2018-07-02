class AddFieldsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :url_alies, :string
    add_column :posts, :thumbnail, :string
  end
end
