class CreateH2oCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :h2o_customers do |t|
      t.string :companyName

      t.timestamps
    end
  end
end
