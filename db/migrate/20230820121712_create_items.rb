# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.text :content
      t.boolean :sale_badge

      t.timestamps
    end
  end
end
