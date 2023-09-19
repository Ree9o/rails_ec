# frozen_string_literal: true

module Admin
  class CheckoutsController < ApplicationController
    def index
      @checkouts = Checkout.includes(:checkout_product).all
    end

    def show
      @checkout_product = CheckoutProduct.find_by(checkout_id: params[:id])
    end
  end
end
