class Goal < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :name, :presence => { :message => "whoa there - you can't NOT fill this out" }

end
