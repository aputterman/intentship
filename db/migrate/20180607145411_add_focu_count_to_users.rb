class AddFocuCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :focus_count, :integer
  end
end
