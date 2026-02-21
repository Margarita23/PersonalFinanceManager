class AddOtypeToOperations < ActiveRecord::Migration[8.0]
  def change
    add_column :operations, :otype, :integer, null: false, default: 0
  end
end
