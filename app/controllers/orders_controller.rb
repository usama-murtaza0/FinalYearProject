class OrdersController < ApplicationController
  
  def index
    @orders = Order.all
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
    if @order.payment_type == "By Card"
      render 'stripe_payment'
    end
    @order.user_id = current_user.id
    @current_cart.line_items.each do |item|
      @order.total_bill += item.total_price
      @order.line_items << item
    end
    
    customer = Stripe::Customer.create(
      email: @order.email,
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @order.total_bill*100,
      description: 'organic products payment',
      currency: 'pkr'
    )
    if charge.present?
      @order.payment_status = "Paid"  
    else
      @order.payment_status = "COD"
    end
    @order.save
    render 'thankyou.html.erb'

  rescue Stripe::CardError => e
    flash[:error] = e.message
  end

private
  
  def order_params
    params.require(:order).permit(:name, :email, :state, :payment_type, :city, :address, :postal_code)
  end

end
