json.id product.id
json.name product.name
json.price product.price
json.images product.images.map { |image| { id: image.id, url: image.url } }
json.description product.description
json.created_at product.created_at
json.updated_at product.updated_at
json.is_discounted? product.is_discounted?
json.supplier product.supplier
json.tax product.tax
json.total product.total
