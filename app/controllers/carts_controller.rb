# frozen_string_literal: true

class CartsController < ApplicationController
before_action :setup_cart_item! ,only: %i[add_item]

  def index
    @cart_item = current_cart.cart_items
  end

  def add_item
    @cart_item = current_cart.cart_items.find_or_initialize_by(item_id: params[:item_id])
    @cart_item.quantity += params[:quantity].to_i
    if @cart_item.save
      redirect_to carts_path, notice: "Successfully."
    else
      flash.now[:alert] = "Failed to add item to the cart."
      render :new # エラーがある場合は同じページを再表示するなど、適切なエラーハンドリングを行う
    end
  end


  private
  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  end

end
