class CreateMindsets < ActiveRecord::Migration
  def change
    create_table :mindsets do |t|
      t.string :name
      t.string :description

      t.timestamps

    end
  end
end
