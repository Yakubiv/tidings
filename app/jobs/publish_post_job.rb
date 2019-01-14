class PublishPostJob < ApplicationJob
  queue_as :default

  def perform(post_id)
    post = Post.find(post_id)
    post.update_column(:status, Post.statuses[:published])
  end
end
