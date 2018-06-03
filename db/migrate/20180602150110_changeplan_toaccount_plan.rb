class ChangeplanToaccountPlan < ActiveRecord::Migration[5.1]
  def change
    rename_column :accounts, :plan, :account_plan
  end
end
