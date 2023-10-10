class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { minimum: 1, maximum: 500 }

  belongs_to :supplier
  has_many :images
  has_many :orders, through: :carted_products
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products

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
