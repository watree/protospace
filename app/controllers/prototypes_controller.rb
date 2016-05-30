class PrototypesController < ApplicationController

  def index
    @prototypes = Prototype.order("created_at DESC").page(params[:page]).per(8)
  end

  def new
    @prototype = Prototype.new
    @prototype.prototype_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: 'Created successfully'
    else
      render :new
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      prototype_images_attributes: [:image, :type]
    )
  end
end
