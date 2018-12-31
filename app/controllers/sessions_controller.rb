class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    session[:user_id] = user.id #TODO: Session HiJack
    flash[:notice] = "User Logged In"
    redirect_to root_path
  end

  def destroy
    reset_session
    flash[:notice] = "User Logged Out"
    redirect_to root_path
  end
end
