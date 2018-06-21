class CreateTroubles < ActiveRecord::Migration[5.1]
  def change
    create_table :troubles do |t|
      t.string :name
      t.float :weight
      t.text :description
      t.text :fa

      t.timestamps
    end
  end
end
