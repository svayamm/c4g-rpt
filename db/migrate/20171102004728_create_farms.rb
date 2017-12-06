class CreateFarms < ActiveRecord::Migration[5.1]
  def change
    create_table :farms do |t|
      t.float :size
      t.string :location
      t.string :irrigation

      t.timestamps
    end
  end
end
