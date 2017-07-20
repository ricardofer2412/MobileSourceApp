class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :custumer_name
      t.integer :ponumber
      t.string :payable
      t.string :status
    

      t.timestamps
    end

  end
end
