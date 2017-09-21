class AddTrackingNumberToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :incoming_tracking, :string
    add_column :orders, :outgoing_tracking, :string
  end
end
