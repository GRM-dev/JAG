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
    @advert.city = City.new
    @advert.job_category = JobCategory.new
    @advert.company = Company.new
    @cities = City.where(province: Province.default)
  end
  
  def create
    ad = advert_params
    @advert = Advert.new(ad)
    @advert.site = get_site_by_name(@advert.url)
    # @advert.job_category = get_jc
    # TODO: dates if nil!!
    # byebug
    if(@advert.save)
      redirect_to advert_path(@advert), notice: t('adverts.show.created')
    else
      $stderr.puts @advert.errors.messages
      redirect_to :back, alert: t('adverts.new.failed')
    end
  end

  def update
    @advert = Advert.find(params[:id])
    # TODO: implement
    
    redirect_to('/')
  end

  def destroy
    Advert.delete(params[:id])
  end
  
  def update_cities
    @cities = City.where(province_id: params[:province_id])
    respond_to do |format|
      format.js
    end
  end
  
  private
  def advert_params
    params.require(:advert).permit(:url, :date_adv_added, :date_expiration, :appointment, :verified, :city_id, :province_id, company_attributes: [:id, :name], job_category_attributes: [:id, :name])
  end
  
=begin
  def get_jc
    jc = params[:advert][:jobcategory][:name]
    if JobCategory.find_by_name(jc) == nil
      JobCategory.create(name: jc)
    end
    JobCategory.find_by_name(jc)
  end
=end
  
  def get_site_by_name(url)
    site = URI.parse(url).host
    site ||= "other"
    if(Site.find_by_name(site) == nil)
      Site.create(name: site, url: 'http://'+site)
    else
      Site.find_by_name(site)
    end
  end
end
