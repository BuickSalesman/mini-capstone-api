class Category < ApplicationRecord
  has_many :category_products
  has_many :products, through: :category_products

  # def products
  #   associated_products = []

  #   category_products.each do |category_product|
  #     associated_products << category_product.product
  #   end

  #   return associated_products
  # end
end
