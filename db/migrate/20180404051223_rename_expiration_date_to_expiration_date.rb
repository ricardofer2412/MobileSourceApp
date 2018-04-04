class RenameExpirationDateToExpirationDate < ActiveRecord::Migration[5.1]
  def change
      rename_column :accounts, :expirationDate, :expiration_date
      rename_column :accounts, :accountStatus, :account_status
end
end
