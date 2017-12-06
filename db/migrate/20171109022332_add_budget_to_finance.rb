class AddBudgetToFinance < ActiveRecord::Migration[5.1]
  def change
    add_column :finances, :budget, :integer
  end
end
