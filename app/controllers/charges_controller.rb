class ChargesController < ApplicationController

  def index
    current_user 
    # @user = User.find_by(id: session[:user_id]).name
  end

  def new
    respond_to do |format|
      format.js 
    end
  end

  def create
    respond_to do |format| 
      if current_user.stripe_id.nil?
        customer = Stripe::Customer.create({"email": current_user.email })
        current_user.update(:stripe_id => customer.id)
      end

      card_token = params[:stripeToken]
      if card_token.nil?
        format.html { redirect_to charges_path, error: "Oops" }
      end 

      customer = Stripe::Customer.new current_user.stripe_id
      customer.source = card_token
      customer.save
      format.html { redirect_to success_path }
    end

    def success
    end


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
