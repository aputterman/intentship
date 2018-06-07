class Timing < ApplicationRecord
  # Direct associations

  belongs_to :reminders,
             :class_name => "Reminder",
             :counter_cache => true

  # Indirect associations

  # Validations

end
