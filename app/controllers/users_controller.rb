class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all.order("created_at DESC")
  end
  
  def show
  end

  def products
  end

  def edit
  end
  
  def update
  end
  
  private
  def find_user
    @user = User.find(params[:id])
  end
end
