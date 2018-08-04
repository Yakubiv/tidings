class PostsController < ApplicationController
  def index
    @posts = Post.send(filter_options)
    @posts = Post.tagged_with(params[:tag]) unless params[:tag].blank?
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def filter_options
    return params[:category] unless params[:category].blank?
    'all'
  end
end
