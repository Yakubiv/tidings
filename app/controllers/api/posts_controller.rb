module Api
  class PostsController < ApplicationController
    def index
      @posts = Post.published.where("title ilike ?", "%#{params[:term]}%")
      render json: @posts.map(&:title)
    end
  end
end
