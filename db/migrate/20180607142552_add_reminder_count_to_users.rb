class AddReminderCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :reminders_count, :integer
  end
end
