class Contact < ActiveRecord::Base
  attr_accessible :name, :phone, :state, :female, :birth_date

  validates :name, :phone, :state, :birth_date, presence: true

  scope :by_state, lambda { |state|
    where(state: state)
  }

end
