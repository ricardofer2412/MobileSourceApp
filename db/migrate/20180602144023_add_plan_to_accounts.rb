class AddPlanToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :plan, :string
  end
end
