# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  def add_item_to_cart(item_id, quantity)
    cart_item = cart_items.find_or_initialize_by(item_id:)
    cart_item.quantity += quantity.to_i
    if cart_item.save
      true
    else
      false
    end
  end

  def total_price
    cart_items.to_a.sum(&:total_price)
  end

  def total_number
    cart_items.to_a.sum(&:quantity)
  end
end
