# frozen_string_literal: true

class CheckoutsController < ApplicationController
  def create
    @checkout = Checkout.new(set_params)
    if @checkout.save!
      session[:cart_id] = nil
      CheckoutMailer.creation_mail(@checkout).deliver_now
      redirect_to root_path, notice: '購入ありがとうございます'
    else
      @cart_items = current_cart.cart_items
      @total_number = current_cart.total_number
      @total_price = current_cart.total_price
      render template: '/carts/index', status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.permit(:firstname, :lastname, :username, :email, :address, :address2, :country, :state, :zip, :cardname, :cardnumber,
                  :expiration, :cvv, :cart_id)
  end
end
