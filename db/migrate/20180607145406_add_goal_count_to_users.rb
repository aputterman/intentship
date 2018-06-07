class AddGoalCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :goals_count, :integer
  end
end
