class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update user_params
      redirect_to root_url, notice: 'Username successfuly updated!'
    else
      render 'edit', notice: "#{user_params} is already taken !"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
