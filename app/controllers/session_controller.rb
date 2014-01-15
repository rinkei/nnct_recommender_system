class SessionController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(handle: user_params[:handle])
    if @user.present?
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Signed in"
    else
      @user = User.new(user_params)
      flash.now.alert = "Invalid name"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out"
  end

  private
  def user_params
    params.require(:user).permit(:handle)
  end
end
