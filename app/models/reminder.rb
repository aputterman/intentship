class Reminder < ApplicationRecord
  # Direct associations

  has_many   :timings,
             :foreign_key => "reminders_id",
             :dependent => :destroy

  belongs_to :mindsets,
             :class_name => "Mindset",
             :counter_cache => true

  belongs_to :focus,
             :class_name => "Focu",
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
