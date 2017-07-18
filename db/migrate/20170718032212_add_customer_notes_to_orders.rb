class AddCustomerNotesToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :customerNotes, :text
  end
end
