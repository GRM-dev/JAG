class AdvertsController < ApplicationController
  before_action :require_mod, only: [:edit, :destroy]
  before_action :require_advert, only: [:new, :create]

  def index
    @adverts = Advert.all
  end

  def show
    @advert = Advert.find(params[:id])
  end

  def edit
    @advert = Advert.find(params[:id])
  end

  def new
    @advert = Advert.new
  end

  def update
    
    redirect_to('/')
  end

  def destroy
    Advert.delete(params[:id])
  end
  
  private
  def advert_params
    params.require(:advert).permit(:company_name, :job_category_name, :city, :url, :date_adv_added, :appointment)
  end
end
