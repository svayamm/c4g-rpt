class AddFarmToCrop < ActiveRecord::Migration[5.1]
  def change
    add_column :crops, :farm_id, :integer
  end
end
