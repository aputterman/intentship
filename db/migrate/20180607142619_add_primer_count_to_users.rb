class AddPrimerCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :primers_count, :integer
  end
end
