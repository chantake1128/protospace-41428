class CommentsController < ApplicationController

  def create
    @user = current_user
    @comment = Comment.new(comment_params)
    @comments = Comment.all
    @prototypes = @user.prototype
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      @prototype = @comment.prototype
      @comments = @prototype.comment.includes(:user)
      render 'prototypes/show', status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
