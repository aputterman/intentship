class AddPrimerCountToMindsets < ActiveRecord::Migration[5.0]
  def change
    add_column :mindsets, :primers_count, :integer
  end
end
