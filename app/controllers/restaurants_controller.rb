class RestaurantsController < ApplicationController
  before_action :doorkeeper_authorize!
  def index
    render json: Restaurant.all
  end

  def create
    restaurant = Restaurant.new(restaurant_params)

    if restaurant.save
      render json: restaurant, status: :created
    else
      render json: restaurant.errors, status: :unproccessable_entity
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :cuisine)
  end
end
