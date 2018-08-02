json.extract! product, :id, :name, :price, :description, :featured, :created_at, :updated_at
json.url product_url(product, format: :json)
