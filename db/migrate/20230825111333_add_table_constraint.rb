# frozen_string_literal: true

class AddTableConstraint < ActiveRecord::Migration[7.0]
  def up
    change_table :items, bulk: true do |t|
      t.change :name, :string, null: false
      t.change :price, :integer, null: false
      t.change :content, :text, null: false
      t.change :sale_badge, :boolean, default: false
    end
  end

  def down
    change_table :items, bulk: true do |t|
      t.change :name, :string, null: true
      t.change :price, :integer, null: true
      t.change :content, :text, null: true
      t.change :sale_badge, :boolean, default: nil
    end
  end
end
