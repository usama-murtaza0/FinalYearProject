class OrdersController < ApplicationController
  
  def index
    @orders = Order.all.where(user_id: current_user.id)
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @order.name = current_user.user_name
    @order.email = current_user.email
    @order.contact = current_user.contact
    @order.state = current_user.state
    @order.city = current_user.city
    @order.address = current_user.address
    @order.postal_code = current_user.postal_code
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @current_cart.line_items.each do |item|
      @order.total_bill += item.total_price
      @order.line_items << item
    end
    
    @order.save

    @current_cart.destroy

    if @order.payment_type == 'By Card'
      redirect_to new_charge_path(@order.id)
    else
      @order.payment_status = 'COD'
      @order.save
      render 'thankyou.html.erb'
    end
  end

private
  
  def order_params
    params.require(:order).permit(:name, :email, :state, :payment_type, :city, :address, :postal_code)
  end

end
