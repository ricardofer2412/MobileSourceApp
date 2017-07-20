class AddTermsToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :terms, :string
  end
end
