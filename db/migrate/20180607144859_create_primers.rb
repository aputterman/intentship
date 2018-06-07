class CreatePrimers < ActiveRecord::Migration
  def change
    create_table :primers do |t|
      t.string :name
      t.string :description
      t.integer :mindsets_id

      t.timestamps

    end
  end
end
