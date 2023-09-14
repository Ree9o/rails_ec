# frozen_string_literal: true

class Checkout < ApplicationRecord
  belongs_to :cart
  has_many :receipt, dependent: :destroy
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
end
