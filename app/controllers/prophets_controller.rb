class ProphetsController < ApplicationController
  skip_before_action :authenticate!, only: :index

  def index
    @prophets = Prophet.includes(:user).not_published.publishing_order.page(params[:page]).per(10)
  end

  def show
    @prophet = Prophet.find(params[:id])
  end

  def new
    @prophet = Prophet.new
  end

  def create
    @prophet = current_user.prophets.new(prophet_params)
    if @prophet.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @prophet = Prophet.find(params[:id])
    if @prophet.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
    def prophet_params
      params.require(:prophet).permit(:text, :published_at)
    end
end
