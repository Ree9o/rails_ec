# frozen_string_literal: true

class CreateCheckoutProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :checkout_products do |t|
      t.references :checkout, null: false, foreign_key: true
      t.string  :name, null: false
      t.integer :price, null: false
      t.integer :quantity, default: 0
      t.timestamps
    end
  end
end
