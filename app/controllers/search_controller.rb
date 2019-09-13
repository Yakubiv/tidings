class SearchController < ApplicationController
  include Pagy::Backend

  layout 'search'

  def index
    @posts = Post.search(params[:search])
    @pagy, @posts = pagy(@posts, items: Post::ITEMS_PER_PAGE, anchor: '#posts')
  end
end