class Goal < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :name, :presence => { :message => "whoa there - you can't NOT fill this out" }

end
