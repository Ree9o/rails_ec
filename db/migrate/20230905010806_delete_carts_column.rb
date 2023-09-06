# frozen_string_literal: true

class DeleteCartsColumn < ActiveRecord::Migration[7.0]
  def up
    remove_column :carts,:item_id,:integer
    remove_column :carts,:cart_items,:integer
    remove_column :carts,:amount,:integer
  end
  def down
    add_column :carts,:item_id,:integer
    add_column :carts,:cart_items,:integer
  end
end
