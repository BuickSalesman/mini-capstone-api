class ProductsController < ApplicationController
  def display_all_method
    @products = Product.all
    render json: @products
  end

  def figgy_pudding_method
    @figgy_pudding = Product.first
    render json: @figgy_pudding
  end

  def panettone_method
    @panettone = Product.last
    render json: @panettone
  end
end
