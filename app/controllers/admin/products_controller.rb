# frozen_string_literal: true

module Admin
  class ProductsController < ApplicationController
    def index
      @items = Item.all
    end

    def show
      @item = Item.find(params[:id])
      @item_latest = Item.recent.first
    end

    def new
      @item = Item.new
    end

    def edit
      @item = Item.find(params[:id])
    end
  end
end
