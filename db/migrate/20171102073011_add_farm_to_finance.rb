class AddFarmToFinance < ActiveRecord::Migration[5.1]
  def change
    add_column :finances, :farm_id, :integer
  end
end
