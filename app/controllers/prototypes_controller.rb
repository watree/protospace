class PrototypesController < ApplicationController

  def index
    @prototypes = Prototype.includes(:user).order("created_at DESC").page(params[:page]).per(8)
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

  def show
    @prototype = Prototype.find(params[:id])
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to root_path, notice: 'Updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    if @prototype.user_id == current_user.id
      @prototype.destroy
      redirect_to root_path, notice: 'Deleted successfully'
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      prototype_images_attributes: [:id, :image, :type, :prototype_id]
    )
  end

end
