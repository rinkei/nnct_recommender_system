class SessionController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.where(email: user_params[:email]).first
    if @user.present? && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Signed in"
    else
      @user = User.new(user_params)
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out"
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
