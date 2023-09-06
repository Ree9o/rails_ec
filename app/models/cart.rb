# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items

  def add_item(item_id)
    cart_items.find_or_initialize_by(item_id: item_id)
  end

  def total_proce
    cart_item.to_a.sum { |item| item.total_price}
  end
  def total_number
    cart_item.to_a.sum { |item| item.quantity}
  end
end
