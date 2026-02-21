class ChangeOdateTypeInOperations < ActiveRecord::Migration[8.0]
  def change
    change_column :operations, :odate, :date
  end
end
