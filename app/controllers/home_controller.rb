class HomeController < ApplicationController
  skip_before_action :authenticate!, only: :index

  def index
    @all_prophets = Prophet.prophetting_order
    @users_prophets = current_user.prophets.prophetting_order if user_signed_in?
  end
end
