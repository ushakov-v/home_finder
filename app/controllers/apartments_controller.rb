class ApartmentsController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    
    def index
      @apartments = Apartment.all
    end
  
    def show
      @apartment = Apartment.find(params[:id])
    end
  
    def new
      @apartment = Apartment.new
    end
  
    def create
      @apartment = Apartment.new(apartment_params)
      @apartment.user = current_user
      
      if @apartment.save
        redirect_to @apartment, notice: 'Объект успешно создан.'
      else
        render :new, status: 422
      end
    end
  
    def edit
      @apartment = Apartment.find(params[:id])
    end
  
    def update
      @apartment = Apartment.find(params[:id])
      
      if @apartment.update(apartment_params)
        redirect_to @apartment, notice: 'Объект успешно загружен.'
      else
        render :edit
      end
    end
  
    def destroy
      @apartment = Apartment.find(params[:id])
      @apartment.destroy
      
      redirect_to apartments_url, notice: 'Объект успешно удалён.'
    end
  
    private
  
    def apartment_params
      params.require(:apartment).permit(:title, :picture, :description, :price, :location)
    end
  end