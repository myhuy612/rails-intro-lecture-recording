class RestaurantsController < ApplicationController
  # load the 'set_restaurant' method for the specified methods before running the rest of the methods
    # before_action is one of rails features
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  # similar to:
  # def update
  #   set_restaurant #i.e. @restaurant = Restaurant.find(params[:id])
  #   @restaurant.update(restaurant_params) # update the selected restaurant with the new params
  #   redirect_to restaurant_path # redirect to show page to see changes made
  # end

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new # show the form
    @restaurant = Restaurant.new
  end

  def create # process input and save the input fields
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to restaurant_path(@restaurant)
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params) # update the selected restaurant with the new params
    redirect_to restaurant_path # redirect to show page to see changes made
  end

  # 303 See Other: always follow with GET — great after form submits/deletes
  # ensures the browser ends up doing a GET to restaurants_path after deletion, preventing accidental re-DELETE if the user refreshes
  def destroy
    @restaurant.destroy # deleted the selected resto
    redirect_to restaurants_path, status: :see_other # redirect to root page
  end
  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end

  def set_restaurant # refactor code as this line is used many times
    @restaurant = Restaurant.find(params[:id]) # find resto to show/edit_update/destroy via id
  end
end
