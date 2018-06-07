class AddReminderCountToMindsets < ActiveRecord::Migration[5.0]
  def change
    add_column :mindsets, :reminders_count, :integer
  end
end
