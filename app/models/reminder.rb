class Reminder < ApplicationRecord
  # Direct associations

  belongs_to :focus,
             :class_name => "Focu",
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
