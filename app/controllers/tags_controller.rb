class TagsController < ApplicationController

  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @prototypes = Prototype \
                    .tagged_with(@tag)
                    .includes(:user)
                    .order(created_at: :DESC)
                    .page(params[:page])
                    .per(8)
  end
end
