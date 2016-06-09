class CommentsController < ApplicationController

  def destroy
  end

  def create
    if params[:post_id] != nil
      @post = Post.find(params[:post_id])
      @comment = Comment.create comment_params
      @post.comments << @comment
    else
      @comment = Comment.find(params[:comment_id])
      comment = Comment.create comment_params
      @comment.comments << comment
    end
    redirect_to :back
  end

private
  def comment_params
    params.require(:comment).permit(:words)
  end
end
