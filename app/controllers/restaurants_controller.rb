class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])

  end

  def create
    restaurant = Restaurant.new(restaurant_params)
    puts restaurant.name
    if restaurant.valid?
      restaurant.save
      redirect_to restaurant_path(restaurant)
    else
      redirect_to new_restaurant_path
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
