# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_cart

  private

  def current_cart
    current_cart = Cart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] ||= current_cart.id
    current_cart
  end
end
