module SessionManageable

  private
    def current_user
      return unless session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end

    def user_signed_in?
      !!session[:user_id]
    end

    def authenticate
      return if user_signed_in?
      redirect_to root_path, alert: "Please Logging In"
    end
end
