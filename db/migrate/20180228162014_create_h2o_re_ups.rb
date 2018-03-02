class CreateH2oReUps < ActiveRecord::Migration[5.1]
  def change
    create_table :h2o_re_ups do |t|
      t.string :companyName
      t.string :simCard
      t.string :phoneNumber
      t.date :reupDate
      t.date :expirationDate
      t.text :pinNumber

      t.timestamps
    end
  end
end
