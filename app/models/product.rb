class Product < ApplicationRecord
  # def is_discounted?
  #   if product.price <= 10
  #     return true
  #   else
  #     return false
  #   end
  # end

  # def tax
  #   tax = (product.price * 0.09)
  # end

  # def total
  #   tax = (product.price * 0.09)
  #   total = product.price + tax
  # end

  def is_discounted?
    price <= 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
