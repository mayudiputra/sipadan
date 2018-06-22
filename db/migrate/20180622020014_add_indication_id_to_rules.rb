class AddIndicationIdToRules < ActiveRecord::Migration[5.1]
  def change
    add_column :rules, :indication_id, :integer
  end
end
