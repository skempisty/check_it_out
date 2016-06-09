class CommentsController < ApplicationController
  # def create
  #   @post =
  #   if @comment.save

  # end

  def destroy
  end


# private
#   def comment_params
#     params.require(:comment).permit(:words)
#   end

def create
      @commentable = find_commentable
      @comment = @commentable.comments.build(comment_params)
      redirect_to root_path
  end

  private

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  def comment_params
    params.require(:comment).permit(:words)
  end
end
