# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_params, only: %i[show update destroy]

  def index
    @items = Item.all
    @total_number = current_cart.total_number
  end

  def show
    @item = Item.find(params[:id])
    @item_latest = Item.recent.first
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_products_path, notice: "アイテム#{@item.name}を登録しました。"
    else
      render 'admin/products/new', status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      redirect_to admin_products_path, notice: "アイテム#{@item.name}を更新しました。"
    else
      render 'admin/products/edit', status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_path, notice: "アイテム#{@item.name}を削除しました。", status: :see_other }
    end
  end

  private

  def set_params
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :item_image, :content, :sale_badge)
  end
end
