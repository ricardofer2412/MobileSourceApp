class CreateUnlocks < ActiveRecord::Migration[5.1]
  def change
    create_table :unlocks do |t|
      t.string :imei
      t.string :request_number
      t.date :date_submitted
      t.string :status

      t.timestamps
    end
  end
end
