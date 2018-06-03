class AddaccountNoteToAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :account_notes, :string

  end
end
