class ChangeNameDefaultValueInGoals < ActiveRecord::Migration[5.0]
  def change
    change_column_default :goals, :name, 'zzthis is the default value to find and replace'
  end
end
