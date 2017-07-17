json.extract! order, :id, :custumer_name, :ponumber, :payable, :status, :created_at, :updated_at
json.url order_url(order, format: :json)
