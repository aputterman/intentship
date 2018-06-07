class Primer < ApplicationRecord
  # Direct associations

  belongs_to :mindsets,
             :class_name => "Mindset",
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :description, :presence => { :message => "whoa there - you can't NOT fill this out" }

  validates :name, :presence => { :message => "whoa there - you can't NOT fill this out" }

end
