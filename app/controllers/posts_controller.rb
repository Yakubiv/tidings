class PostsController < ApplicationController
  def index
    @posts = Post.includes(:tags).send(filter_options)
    @posts = Post.includes(:tags).tagged_with(params[:tag]) unless params[:tag].blank?
  end

  def show
    if post = Post.find_by(url_alies: params[:id])
      redirect_to post_path(post)
    else
      @post = Post.includes(:tags).friendly.find(params[:id])
    end
  end

  private

  def filter_options
    return params[:category] unless params[:category].blank?
    'all'
  end
end
