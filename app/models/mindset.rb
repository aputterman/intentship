class Mindset < ApplicationRecord
  # Direct associations

  has_many   :primers,
             :foreign_key => "mindsets_id",
             :dependent => :destroy

  has_many   :reminders,
             :foreign_key => "mindsets_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :description, :presence => { :message => "whoa there - you can't NOT fill this out" }

  validates :name, :presence => { :message => "whoa there - you can't NOT fill this out" }

end
