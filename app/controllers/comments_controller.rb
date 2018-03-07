class CommentsController < ApplicationController

  def new
    @place = params[:place]
    @comment = Comment.new
  end

  def create

  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
