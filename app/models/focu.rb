class Focu < ApplicationRecord
  # Direct associations

  has_many   :reminders,
             :foreign_key => "focus_id",
             :dependent => :destroy

  belongs_to :goals,
             :class_name => "Goal",
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :description, :presence => { :message => "whoa there - you can't NOT fill this out" }

  validates :name, :presence => { :message => "whoa there - you can't NOT fill this out" }

end
