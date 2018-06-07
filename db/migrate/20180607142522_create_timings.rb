class CreateTimings < ActiveRecord::Migration
  def change
    create_table :timings do |t|
      t.time :time
      t.date :date
      t.string :day
      t.integer :reminders_id

      t.timestamps

    end
  end
end
