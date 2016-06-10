class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      if current_user
        current_user.posts << @post
      end
      redirect_to post_path(@post.id)
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
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def follow_index
    followed = Following.where(follower_id: current_user.id)
    followed_user_array = []

    followed.each do |leader|
      followed_user_array << leader.user_id
    end

    @posts = Post.where(user_id: followed_user_array)
  end

private
  def post_params
    params.require(:post).permit(:title, :words)
  end
end
