class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if current_user.update(update_params)
      redirect_to root_path, notice: 'Updated successfully'
    else
      render :edit
    end
  end

  private
  def update_params
   params.require(:user).permit(:nickname, :avatar, :profile, :member, :works)
  end
end
