class AddTroubleIdToRules < ActiveRecord::Migration[5.1]
  def change
    add_column :rules, :trouble_id, :integer
  end
end
