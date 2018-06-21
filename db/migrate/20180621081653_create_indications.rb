class CreateIndications < ActiveRecord::Migration[5.1]
  def change
    create_table :indications do |t|
      t.string :name

      t.timestamps
    end
  end
end
