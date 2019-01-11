class PublishPostService
  def self.call(post_id)
    new(post_id).process
  end

  attr_reader :post

  def initiliaze(post_id)
    @post = Post.find(post_id)
  end

  def process
    post.update(status: Post.statuses[:published])
  end
end
