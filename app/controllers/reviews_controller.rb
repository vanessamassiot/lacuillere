class ReviewsController < ApplicationController
  before_action :find_restaurant, only: [ :new, :create ]

  def index
     @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    @review.save
    if @review.valid?
      redirect_to restaurant_path(@review)
    else
      render :new
    end
  end


  def show
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :restaurant_id)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
