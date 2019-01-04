class SessionsController < ApplicationController
  skip_before_action :authenticate!, only: :create

  def create
    user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    session[:user_id] = user.id #TODO: Session HiJack
    flash[:notice] = "User Logged In"
    if params[:option] == "post"
      redirect_to new_prophet_path
    else
      redirect_to root_path
    end
  end

  def destroy
    reset_session
    flash[:notice] = "User Logged Out"
    redirect_to root_path
  end
end
