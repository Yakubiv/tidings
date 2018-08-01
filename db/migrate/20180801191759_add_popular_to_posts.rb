class AddPopularToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :popular, :boolean, default: false
  end
end
