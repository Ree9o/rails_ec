# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart

  def total_price
    item.price * quantity
  end
end
