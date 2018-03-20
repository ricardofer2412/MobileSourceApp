class AddCustomerNameToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :customerName, :string
  end
end
