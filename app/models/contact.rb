class Contact < ActiveRecord::Base
  attr_accessible :name, :phone, :state, :female, :birth_date

  validates :name, :phone, :state, :birth_date, presence: true
end
