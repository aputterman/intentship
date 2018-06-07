class AddFocuCountToGoals < ActiveRecord::Migration[5.0]
  def change
    add_column :goals, :focus_count, :integer
  end
end
