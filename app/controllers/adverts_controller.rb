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
  end
  
  def create
    ad = advert_params
    @advert = Advert.new(ad)
    @advert.site = get_site_by_name(@advert.url)
    # @advert.job_category = get_jc
    # TODO: dates if nil!!
    # byebug
    if(@advert.save)
      redirect_to edit_advert_path(@advert), notice: "Advert created succesfully!"
    else
      $stderr.puts @advert.errors.messages
      redirect_to :back, alert: "Query failed. Check if all fields filled and try again later"
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
  
  def create_city
    @city = City.new(city_params)
    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'Miasto dodane.' }
        format.json { render action: 'show', status: :created, location: @city }
        format.js   { render action: 'show', status: :created, location: @city }
      else
        format.html { render action: 'new' }
        format.json { render json: @city.errors, status: :unprocessable_entity }
        format.js   { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def advert_params
    params.require(:advert).permit(:url, :date_adv_added, :date_expiration, :appointment, :verified, :city_id, :province_id, company_attributes: [:id, :name], job_category_attributes: [:id, :name])
  end
  
  private
  def city_params
      params.require(:city).permit(:id, :name, :province_id)
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
