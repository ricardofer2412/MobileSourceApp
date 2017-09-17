class AddDueDateToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :due_date, :date
  end
end
