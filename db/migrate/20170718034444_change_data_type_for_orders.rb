class ChangeDataTypeForOrders < ActiveRecord::Migration[5.1]
  def change
    change_column :orders , :customerNotes , :string
  end
end
