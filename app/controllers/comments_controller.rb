class CommentsController < ApplicationController

  def create
    if params[:post_id] != nil
      @post = Post.find(params[:post_id])
      @comment = Comment.create comment_params
      @post.comments << @comment
      current_user.comments << @comment
    else
      @comment = Comment.find(params[:comment_id])
      comment = Comment.create comment_params
      @comment.comments << comment
      current_user.comments << comment
    end
    redirect_to :back
  end

  def edit
    if params[:post_id] != nil
      @post = Post.find(params[:post_id])
      @comment = Comment.find(params[:id])
    else
      @comment = Comment.find(params[:id])
      @reply = Comment.find(params[:comment_id])
    end
  end

  def update
    if params[:post_id] != nil
      @post = Post.find(params[:post_id])
      @comment = Comment.update comment_params
      redirect_to posts_path
    else
      @comment = Comment.find(params[:comment_id])
      comment = Comment.update comment_params
      redirect_to posts_path
    end
  end

  def destroy

  end

private
  def comment_params
    params.require(:comment).permit(:words)
  end
end
