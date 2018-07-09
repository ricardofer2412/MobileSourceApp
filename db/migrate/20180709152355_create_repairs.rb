class CreateRepairs < ActiveRecord::Migration[5.1]
  def change
    create_table :repairs do |t|
      t.string :model_name
      t.integer :repair_price
      t.string :part_cost

      t.timestamps
    end
  end
end
