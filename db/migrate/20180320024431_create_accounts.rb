class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :balance
      t.string :expirationDate
      t.string :accountStatus
      t.string :expiredAccount
      t.string :simcardNumber
      t.string :phoneNumber

      t.timestamps
    end
  end
end
