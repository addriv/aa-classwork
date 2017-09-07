class CommentsController < ApplicationController

  def show
    @comment = Comment.find_by_id(params[:id].to_i)

    render 'show'
  end

  def create

    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to fuck_url(comment_params[:fuck_id])
    # TODO - handle missing bodies
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :fuck_id, :parent_id)
  end
end
