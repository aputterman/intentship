class User < ApplicationRecord
  # Direct associations

  has_many   :reminders,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :presence => { :message => "whoa there - you can't NOT fill this out" }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
