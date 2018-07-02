class PostsController < ApplicationController
  def intex
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
end
