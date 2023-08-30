# frozen_string_literal: true

module Admin
  class ProductsController < ApplicationController
    before_action :basic_auth

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

    private

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end
  end
end
