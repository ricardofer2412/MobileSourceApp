class AddPaymentSentToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :payment_sent, :date
  end
end
