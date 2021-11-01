class RestaurantsController < ApplicationController
  def index
    render json: Restaurant.all
  end

  def create
    restaurant = Restaurant.new(name: 'Vinh Xuong', address: 'Zuni', cuisine: 'Viatnamese')

    if restaurant.save
      render json: restaurant, status: :created
    else
      render json: restaurant.errors, status: :unproccessable_entity
    end
  end
end
