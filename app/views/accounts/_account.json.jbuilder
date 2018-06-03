json.extract! account, :id, :customer_name, :nickname, :balance,:account_plan, :account_notes,  :expiration_date, :account_status, :expiredAccount, :simcardNumber, :phoneNumber, :created_at, :updated_at
json.url account_url(account, format: :json)
