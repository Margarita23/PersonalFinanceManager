class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(login: params[:login])
    if user && user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Ви увійшли у акаунт!"
    else
      redirect_to login_path, alert: "Невірний логін або пароль."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Ви вийшли з акаунту!"
  end
end
