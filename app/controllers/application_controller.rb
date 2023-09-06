# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_cart
  private
  def current_cart
    if session[:cart_id]
      @current_cart = Cart.find_by(id: session[:cart_id])
    else
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end
    return @current_cart
  end

end
