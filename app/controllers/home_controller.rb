class HomeController < ApplicationController
  skip_before_action :authenticate!, only: :index

  def index
    @prophets = Prophet.all.order(published_at: :asc)
  end
end
