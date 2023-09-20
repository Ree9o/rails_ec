# frozen_string_literal: true

class CheckoutProduct < ApplicationRecord
  belongs_to :checkout
  has_many :item, dependent: :destroy
end
