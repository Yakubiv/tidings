class HomeFacade
  def big_featured
    posts.detect { |p| p.big_featured }
  end

  def featured_first
    featured.first(2).last
  end

  def featured_last
    featured.first
  end

  def popular_posts
    posts.where(popular: true).first(6)
  end

  def posts
    @posts ||= Post.includes(:tags).where(status: :published)
  end

  private

  def featured
    @featured ||= posts.select { |p| p.featured }
  end
end
