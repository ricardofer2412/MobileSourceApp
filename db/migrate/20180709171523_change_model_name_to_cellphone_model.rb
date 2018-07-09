class ChangeModelNameToCellphoneModel < ActiveRecord::Migration[5.1]
  def change
    rename_column :repairs, :model_name, :cellphone_model
  end
end
