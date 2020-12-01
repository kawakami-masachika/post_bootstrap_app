class PostsController < ApplicationController
  before_action :set_post, only: %w(show edit update destroy) 
  def index
    @posts = Post.order(id: "asc")
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    redirect_to @post, notice: "投稿しました"
  end

  def edit
  end

  def update
    @post.update!(post_params)
    redirect_to @post, notice: "更新しました"
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy!
    redirect_to root_path, alert: "削除しました"
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
