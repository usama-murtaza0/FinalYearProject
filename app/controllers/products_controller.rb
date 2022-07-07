require 'pry'
class ProductsController < ApplicationController
  include Reviewable

  before_action :find_product, only: [:show, :edit, :update, :destroy, :relist, :delist]

  def index
    @products = Product.all.order("created_at DESC").where(product_status: false)
  end
  
  def search
    @products = Product.where('title LIKE ?', "%#{params[:search_query]}%")
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def show 
    @user = User.find(@product.user_id)
    @category = Category.find(@product.category_id)
    @reviews = Review.where(product_id: @product.id)
    @eligible_for_review = eligible_for_review?(@product.id) 
  end 

  def edit
  end
  
  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to user_path(current_user.id)
  end 
  
  def delist
    @product.product_status = false
    @product.save
    redirect_to products_user_path(@product.user_id)
  end
  
  def relist
    @product.product_status = true
    @product.save
    redirect_to products_user_path(@product.user_id)
  end

  private
  
  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :price, :description, :quantity, :packing, :size, :sale, { pictures: [] }, :category_id)
  end

end
