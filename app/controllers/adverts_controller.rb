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
    city = City.new
    company = Company.new
    @advert.city = city
    @advert.company = company
  end
  
  def create
    ad = advert_params
    @advert = Advert.new(ad)
    if JobCategory.find_by_name(jc_params) == nil
      JobCategory.create(name: jc_params)
    end
    @advert.job_category = JobCategory.find_by_name(jc_params)
    @advert.date_link_added = DateTime.now
    @advert.site = get_site_by_name(@advert.url)
    if(@advert.save)
      redirect_to root_path
    else
      $stderr.puts @advert.errors.messages
      redirect_to :back, alert: "Query failed. Check if all fields filled and try again later"
    end
  end

  def update
    # TODO: implement
    redirect_to('/')
  end

  def destroy
    Advert.delete(params[:id])
  end
  
  private
  def advert_params
    params.require(:advert).permit(:url, :date_adv_added, :date_expiration, :appointment, :verified, job_category_attributes: [:name], company_attributes: [:name], city_attributes: [:name, :province_id])
  end
  
  def jc_params
    params[:advert][:jobcategory][:name]
  end
  
  def get_site_by_name(url)
    site = URI.parse(url).host
    site ||= "undefined"
    if(Site.find_by_name(site) == nil)
      Site.new(name: site)
    else
      Site.find_by_name(site)
    end
  end
end
