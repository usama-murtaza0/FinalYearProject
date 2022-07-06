class ChargesController < ApplicationController
  
  def new
  end

  def new_charge
    @order = Order.find(params[:id])
    if @order.payment_status == 'paid'
      flash[:notice] = "This order was already paid for."
      render 'orders/thankyou.html.erb'
    end
  end

  def create
    @order = Order.find(params[:order_id])
    @amount = @order.total_bill

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )
    
    if charge
      @order.payment_status = 'paid'
      @order.save
      flash[:notice] = "We have received your payment"
      render 'orders/thankyou.html.erb'
    else
      raise "Payment wasn't able to process"
    end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
  
end
