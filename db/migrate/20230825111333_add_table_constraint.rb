# frozen_string_literal: true

class AddTableConstraint < ActiveRecord::Migration[7.0]
  def up
    change_table :items, bulk: true
    change_column :items, :sale_badge, :boolean, default: false
  end
end
