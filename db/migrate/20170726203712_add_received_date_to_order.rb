class AddReceivedDateToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :receivedDate, :date
  end
end
