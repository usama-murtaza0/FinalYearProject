class UsersController < ApplicationController
  before_action :find_user, except: [:index]

  def index
    @users = User.order("created_at DESC")
  end
  
  def show
  end

  def products
  end

  def orders
    if current_user.user_type == "Vendor" 
      vendor_product_ids = Product.where(user_id: current_user.id).pluck(:id)
      @orders = Order.joins(:line_items).where("orders.id = line_items.order_id and line_items.product_id in (?) ", vendor_product_ids)
    elsif current_user.user_type = "Customer"
      @orders = Order.all.where(user_id: current_user.id)
    end
  end

  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id) 
    else
      render 'edit'
    end
  end
  
  def deactivate
    @user.deactivated = true
    @user.save
    redirect_to users_path
  end

  def activate
    @user.deactivated = false
    @user.save
    redirect_to users_path
  end

  def order_status
    @user.order_status = true
  end
  
  private

  def find_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :contact, :physical_store_address, :picture)
  end

end
