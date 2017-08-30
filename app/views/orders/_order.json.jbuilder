json.extract! order, :id, :custumer_name, :ponumber, :email, :payable ,:terms ,  :status, :customerNotes,:created_at, :updated_at, :expectedDate, :payment_sent:
json.url order_url(order, format: :json)
