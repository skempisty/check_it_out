class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      post = Post.create(post_params)
      if current_user != nil
        current_user.posts << post
      end
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.save
      @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
  end

private
  def post_params
    params.require(:post).permit(:title, :words)

  end
end
