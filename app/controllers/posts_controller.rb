class PostsController < ApplicationController
  before_action :tag_cloud

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all.ordered.page(params[:page]).per(5)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  def tag_cloud
    @tags = Post.tag_counts_on(:tags)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :date, :tag_list)
  end
end
