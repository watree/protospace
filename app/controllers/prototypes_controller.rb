class PrototypesController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]

  def index
    @prototypes = Prototype \
                   .includes(:user)
                   .order(created_at: :DESC)
                   .page(params[:page])
                   .per(8)
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
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user, :prototype)
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to root_path, notice: 'Updated successfully'
    else
      render :edit
    end
  end

  def destroy
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
    ).merge(tag_list: params[:prototype][:tag_list])
  end

  def set_product
    @prototype = Prototype.find(params[:id])
  end

end
