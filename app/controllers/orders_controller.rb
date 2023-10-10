class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    carted_products = current_user.carted_products.where(status: "carted")

    subtotal = 0
    carted_products.each do |carted_product|
      product = carted_product.product
      subtotal += product.price * carted_product.quantity
    end
    tax = subtotal * 0.09
    total = subtotal + tax

    @order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total,
    )

    if @order.save
      carted_products.update_all(status: "purchased", order_id: @order.id)
      render :show
    else
      render json: unprocessable_entity
    end
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])
    render :show
  end

  def index
    @orders = current_user.orders
    render :index
  end
end
