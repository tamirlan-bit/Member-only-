class CommentsController < ApplicationController
 def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    puts "DEBUG: Comment saved? #{@comment.persisted?} | Errors: #{@comment.errors.full_messages}"
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
