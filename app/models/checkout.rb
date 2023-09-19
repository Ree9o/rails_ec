# frozen_string_literal: true

class Checkout < ApplicationRecord
  after_save :create_checkouts

  belongs_to :cart
  has_many :checkout_product, dependent: :destroy

  with_options presence: true do
    validates :firstname
    validates :lastname
    validates :username
    validates :address
    validates :country
    validates :state
    validates :zip
    validates :cardname
    validates :cardnumber
    validates :expiration
    validates :cvv
  end

  with_options numericality: true do
    validates :cardnumber
    validates :cvv
  end
  validates :username, uniqueness: true
  validates :cardnumber, length: { minimum: 14 }
  validates :cvv, length: { minimum: 3 }
  validates :expiration, format: { with: %r{\A[0-9]{2}/[0-9]{2}\z} }

  private

  def create_checkouts
    cart.cart_items.each do |cart_item|
      name = cart_item.item.name
      price = cart_item.item.price
      quantity = cart_item.quantity
      checkout_product = CheckoutProduct.new(checkout_id: id, name:, price:, quantity:)
      checkout_product.save!
    end
  end
end
