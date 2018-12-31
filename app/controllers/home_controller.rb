class HomeController < ApplicationController
  def index
    @prophets = Prophet.all
  end
end
