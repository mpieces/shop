class ChargesController < ApplicationController

  def index
    @user = User.find_by(id: session[:user_id]).name
  end

  def new
    respond_to do |format|
      format.js 
    end
  end

  def create
  end
  #   @amount = 500

  #   customer = Stripe::Customer.create(
  #     email: params[:stripeEmail],
  #     source: params[:stripeToken]
  #   )
    

  #   charge = Stripe::Charge.create(
  #     customer: customer.id,
  #     amount: @amount,
  #     description: 'Rails Stripe customer',
  #     currency: 'usd'
  #   )

  # rescue Stripe::CardError => e 
  #   flash[:error] = e.message
  #   redirect_to new_charge_path
  # end
end
