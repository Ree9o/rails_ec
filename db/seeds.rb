# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Item.destroy_all
6.times do |count|
  count += 1
  item = Item.create!(
    name: 'Pokemon Card',
    price: 1200 * count,
    content: 'kawaii pokemon card',
    sale_badge: false
  )
  item.item_image.attach(io: File.open("app/assets/images/Capture-#{count}.png"),
                         filename: "Capture-#{count}.png")
end
