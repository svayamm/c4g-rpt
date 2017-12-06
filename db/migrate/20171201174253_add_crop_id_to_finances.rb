class AddCropIdToFinances < ActiveRecord::Migration[5.1]
  def change
    add_column :finances, :crop_id, :integer
  end
end
