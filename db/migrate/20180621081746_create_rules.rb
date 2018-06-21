class CreateRules < ActiveRecord::Migration[5.1]
  def change
    create_table :rules do |t|
      t.integer :id_trouble
      t.integer :id_indication
      t.float :weight

      t.timestamps
    end
  end
end
