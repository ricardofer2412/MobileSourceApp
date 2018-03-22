class ChangeBalanceTypeInAccounts < ActiveRecord::Migration[5.1]
  def change
    def self.up
    change_column :accounts, :balance, :float
  end

  def self.down
    change_column :accounts, :balance, :string

  end
end
end
