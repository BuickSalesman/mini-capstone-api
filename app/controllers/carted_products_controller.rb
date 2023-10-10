class CartedProductsController < ApplicationController
  def create
    @carted_product = CartedProduct.create(
      user_id: params[:user_id],
      product_id: params[:product_id],
      status: "carted",
      order_id: nil,
    )
    render :show
  end

  def index
    def index
      @carted_products = CartedProduct.where(status: "carted")
      render :index
    end
  end

  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.destroy
    render json: { message: "Products destroyed successfully!" }
  end
end
