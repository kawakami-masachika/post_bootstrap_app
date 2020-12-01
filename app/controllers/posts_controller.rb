class PostsController < ApplicationController
  before_action :set_post, only: %w(show edit update destroy) 
  def index
    @post = Post.order(id: "asc")
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    redirect_to podt
  end

  def edit
  end

  def update
    @post.update
    redirect_to @post
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy!
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
