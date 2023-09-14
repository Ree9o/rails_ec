# frozen_string_literal: true

class CreateCheckouts < ActiveRecord::Migration[7.0]
  def change
    create_table :checkouts do |t|
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.string :username, null: false
      t.string :email
      t.text :address, null: false
      t.text :address2
      t.string :country, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.string :cardname, null: false
      t.bigint :cardnumber, null: false
      t.string :expiration, null: false
      t.integer :cvv, null: false
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
    add_index :checkouts, :username, unique: true
    add_index :checkouts, :email, unique: true
  end
end
