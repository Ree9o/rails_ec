# frozen_string_literal: true

class Item < ApplicationRecord
  has_one_attached :item_image do |attach|
    attach.variant :thumb, resize_to_limit: [450, 300]
    attach.variant :specific, resize_to_limit: [600, 700]
  end

  # scope for latest_item
  scope :recent, -> { order(created_at: :desc) }
end
