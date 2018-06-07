class CreateMindsets < ActiveRecord::Migration
  def change
    create_table :mindsets do |t|
      t.string :name
      t.string :description
      t.integer :user_id

      t.timestamps

    end
  end
end
