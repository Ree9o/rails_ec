# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  def add_item_to_cart(cart, itemid, quantity)
    cart_item = cart.cart_items.find_or_initialize_by(item_id: itemid)
    cart_item.quantity += quantity.to_i
    if cart_item.save
      true
    else
      false
    end
  end
end
