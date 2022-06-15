class CategoriesController < ApplicationController
  before_action :find_category, only: [:products]

  def index
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
    
  def products
    
  end

  private
  
  def find_category
    @category = Category.find(params[:id])
  end

end
