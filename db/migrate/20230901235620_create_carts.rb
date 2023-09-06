# frozen_string_literal: true

class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.integer :item_id, null: false
      t.integer :amount, null: false
      t.integer :cart_items, null: false

      t.timestamps
    end
  end
end
