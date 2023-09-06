# frozen_string_literal: true

class DeleteCartsColumn < ActiveRecord::Migration[7.0]
  def up
    remove_columns :carts, :item_id, :cart_items, :amount
  end

  def down
    add_columns :carts, :item_id, :cart_items, :amount
  end
end
