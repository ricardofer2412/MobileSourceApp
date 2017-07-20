class AddExpecteDateToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :expectedDate, :date
  end
end
