# frozen_string_literal: true

class Receipt < ApplicationRecord
  belongs_to :checkout
  has_many :item, dependent: :destroy

  def self.create_receipt(checkout)
    checkout.cart.cart_items.each do |cart_item|
      name = cart_item.item.name
      price = cart_item.item.price
      quantity = cart_item.quantity
      receipt = Receipt.new(checkout_id: checkout.id, name:, price:, quantity:)
      receipt.save!
    end
  end
end
