json.extract! account, :id, :customerName, :nickname, :balance, :expirationDate, :accountStatus, :expiredAccount, :simcardNumber, :phoneNumber, :created_at, :updated_at
json.url account_url(account, format: :json)
