class ReviewsController < ApplicationController
  include Reviewable
  
  before_action :find_review, only: [:show, :edit, :update, :destroy]
  
  def index
    @reviews = Review.all.order("created_at DESC")
  end

  def new
    @eligible_for_review = eligible_for_review?(params[:product_id])
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def show
  end

  def create
    @review = Review.new(review_params)
    @review.rating = params[:rating]
    @review.user_id = current_user.id
    if @review.save
      redirect_to product_path(@review.product_id)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @review
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    redirect_to root_path
  end

  private

  def find_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:body, :product_id)
  end
end
