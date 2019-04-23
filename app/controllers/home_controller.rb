class HomeController < ApplicationController
  skip_before_action :authenticate!, only: :index

  def index
    @all_prophets = Prophet.all.order(published_at: :asc)
    @users_prophets = current_user.prophets.order(published_at: :asc) if user_signed_in?
  end
end
