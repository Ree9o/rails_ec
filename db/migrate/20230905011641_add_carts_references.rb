# frozen_string_literal: true

class AddCartsReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :carts, :item, foreign_key: true
  end
end
