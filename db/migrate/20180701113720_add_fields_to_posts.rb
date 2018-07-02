class AddFieldsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :url_alies, :string
    add_column :posts, :thumbnail, :string
    add_column :posts, :meta_tags, :string, array: true, default: []
    add_column :posts, :category, :integer
    add_column :posts, :status, :integer
    add_column :posts, :big_featured, :boolean, default: false
    add_column :posts, :featured, :boolean, default: false
  end
end
