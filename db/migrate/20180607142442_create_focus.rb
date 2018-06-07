class CreateFocus < ActiveRecord::Migration
  def change
    create_table :focus do |t|
      t.string :name
      t.integer :goals_id
      t.integer :mindsets_id
      t.string :description
      t.integer :user_id

      t.timestamps

    end
  end
end
