class AddTimingCountToReminders < ActiveRecord::Migration[5.0]
  def change
    add_column :reminders, :timings_count, :integer
  end
end
