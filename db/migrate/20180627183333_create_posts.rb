class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.text :content
      t.string :tags, array: true, default: []
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
