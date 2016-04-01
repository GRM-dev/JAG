class CitiesController < ApplicationController
    
    def index
        @cities = City.all
    end
    
    def new
        @city = City.new
    end
    
    def create
        @city = City.new(city_params)
        respond_to do |format|
          if @city.save
            format.html { redirect_to new_advert_path, notice: 'Miasto dodane.' }
            format.json { render action: 'show', status: :created, location: @city }
            format.js   { render action: 'show', status: :created, location: @city }
          else
            format.html { render action: 'new', notice: 'Bląd! Spróbuj ponownie później.' }
            format.json { render json: @city.errors, status: :unprocessable_entity }
            format.js   { render json: @city.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        City.destroy(params[:id])
        redirect_to cities_path
    end

    private
    def city_params
      params.require(:city).permit(:id, :name, :province_id)
    end
end
