class Focu < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :description, :presence => { :message => "whoa there - you can't NOT fill this out" }

  validates :name, :presence => { :message => "whoa there - you can't NOT fill this out" }

end
