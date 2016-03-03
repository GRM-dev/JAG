class AdvertsController < ApplicationController
  before_action :require_mod, only: [:edit, :destroy]

  def index
    @adverts = Advert.all
  end

  def show
    @advert = Advert.find(params[:id])
  end

  def edit
    @advert = Advert.find(params[:id])
  end

  def update

    redirect_to('/')
  end

  def destroy
    Advert.delete(params[:id])
  end
end
