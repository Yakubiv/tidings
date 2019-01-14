class Admin::PostsController < Admin::BaseController
  before_action :set_post, only: [:edit, :update, :destroy]
  autocomplete :tag, :name, class_name: 'ActsAsTaggableOn::Tag'

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    if @post = Post.create(post_params)

      redirect_to %i[admin posts], notice: 'Post was successfully created.'
    else
      render :new
    end
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
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :category,
                                 :status, :big_featured, :next_post, :back_post,
                                 :featured, :popular, :publish_at,
                                 :content, :thumbnail, tag_list: []).merge(meta_tags: meta_tags)
  end
end
