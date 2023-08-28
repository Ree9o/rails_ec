# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_params, only: %i[show]

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @item_latest = Item.recent.first
  end

  private

  def set_params
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :item_image, :content, :sale_badge)
  end
end
