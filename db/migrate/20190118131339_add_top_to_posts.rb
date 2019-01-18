class AddTopToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :top, :boolean, default: false
  end
end
