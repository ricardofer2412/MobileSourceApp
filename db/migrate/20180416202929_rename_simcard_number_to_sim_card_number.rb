class RenameSimcardNumberToSimCardNumber < ActiveRecord::Migration[5.1]
  def change
    rename_column :accounts, :simcardNumber, :sim_card_number
  end
end
