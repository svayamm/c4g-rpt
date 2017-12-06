class CreateFinances < ActiveRecord::Migration[5.1]
  def change
    create_table :finances do |t|
      t.float :outstanding_loan
      t.float :interest_rate

      t.timestamps
    end
  end
end
