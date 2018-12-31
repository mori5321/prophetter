class ApplicationController < ActionController::Base
  include SessionManageable
  helper_method :current_user, :user_signed_in?
end
