# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_params, only: %i[show edit update destroy]

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

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to items_path, notice: "アイテム#{@item.name}を登録しました。"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @item.save!
      redirect_to items_path, notice: "アイテム#{@item.name}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: "アイテム#{@item.name}を削除しました。"
  end

  private

  def set_params
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :item_image, :content, :sale_badge)
  end
end
