# frozen_string_literal: true

class CartsController < ApplicationController
  def index
    @cart_items = current_cart.cart_items
    @total_price = current_cart.total_price
    @total_number = current_cart.total_number
  end

  def create
    if current_cart.add_item_to_cart(params[:item_id], params[:quantity])
      redirect_to carts_path, notice: 'Successfully.'
    else
      flash.now[:alert] = 'Failed to add item to the cart.'
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    current_cart.cart_items.find_by(id: params[:id]).destroy
    redirect_to carts_path
  end
end
