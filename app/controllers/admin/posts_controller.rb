class Admin::PostsController < Admin::BaseController
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.create(post_params)

    redirect_to [:admin, :posts], notice: 'Post was successfully created.'
  end

  def update
    @post.update(post_params)
    redirect_to admin_posts_url, notice: 'Post was successfully updated.'
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  def meta_tags
    params[:meta_tags].split(',')
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :url_alies, :category,
                                 :status, :big_featured,
                                 :featured, :popular, :tag_list,
                                 :content, :thumbnail).merge(meta_tags: meta_tags)
  end
end
