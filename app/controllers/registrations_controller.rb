class RegistrationsController < ApplicationController
  def new
    user = User.find_by(id: session[:user_id])
    redirect_to dashboards_path if user
    @user = User.new
  end

  def create
    @user = User.new(user_parms)

    if @user.save
      redirect_to new_login_path
    else
      flash[:alert] = "Couldn't save the user !! Please input all the details !!! "
      render :new , status: :unprocessable_entity #this entity is to let rails know that we are not redirecting

    end

  end

  private

    def user_parms
      params.require(:user).permit(:email, :password)
    end
end
