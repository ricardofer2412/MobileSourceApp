json.extract! unlock, :id, :imei, :request_number, :date_submitted, :status, :created_at, :updated_at
json.url unlock_url(unlock, format: :json)
