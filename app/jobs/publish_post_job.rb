class PublishPostJob < ApplicationJob
  queue_as :default

  def perform(post_id)
    PublishPostService.(post_id)
  end
end
