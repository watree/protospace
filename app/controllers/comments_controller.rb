class CommentsController < ApplicationController
before_action :set_prototype, only: :create
  def create
    @prototype.comments.create(comments_params)
    @comments = @prototype.comments
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end

  def comments_params
    params.require(:comment).permit(:user_id, :text)
  end
end
