class AddReferralsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :next_post_id, :integer, index: true
    add_column :posts, :back_post_id, :integer, index: true
  end
end
