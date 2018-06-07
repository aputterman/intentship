class AddReminderCountToFocus < ActiveRecord::Migration[5.0]
  def change
    add_column :focus, :reminders_count, :integer
  end
end
