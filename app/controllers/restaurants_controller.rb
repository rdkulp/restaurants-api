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

  def me
    respond_with current_resource_owner
  end

  private

  def current_resource_owner
    User.find(doorkeeper_token.resource_ownder_id) if doorkeeper_token
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :cuisine)
  end
end
