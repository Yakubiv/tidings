class HomeFacade
  def big_featured
    posts.detect { |p| p.big_featured == true }
  end

  def featured_first
    featured.first
  end

  def featured_last
    featured.last
  end

  def posts
    @posts ||= Post.where(status: :published)
  end

  private

  def featured
    @featured ||= posts.select { |p| p.featured == true }
  end
end
