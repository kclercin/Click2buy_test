require 'click2buy_api'
class ProductsController < ApplicationController
  before_action :require_user
  before_action :set_product, only: [:add_to_cart]

  def index
    @products = Product.all
  end

  def refresh_products
    @api = Click2buyApi.new("FmMvBtunzjXkeNVU5CxcP56M")
    @categories = JSON.parse(@api.get_products("ST2-77d93ca","50055"))
    @categories.each do |category|
      category.each do |product|
        @product = Product.new
        @product.product_id = product["id"]
        @product.description = product["description_short"]
        @product.name = product["name"]
        @product.thumbnail = product["img"]["medium"]
        @product.price = product["price"]
        @product.save
      end
    end
    redirect_to products_path
  end

  def add_to_cart
    current_user.products << @product
    respond_to do |format|
      format.js{
        render layout: false
      }
    end
  end

private

  def set_product
    @product = Product.find_by_id params[:id]
    redirect_to products_path unless @product
  end
end
