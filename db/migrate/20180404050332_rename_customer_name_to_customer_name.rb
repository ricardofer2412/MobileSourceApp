class RenameCustomerNameToCustomerName < ActiveRecord::Migration[5.1]
  def change
    rename_column :accounts, :customerName, :customer_name
  end
end
