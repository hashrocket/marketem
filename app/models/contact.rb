class Contact < ActiveRecord::Base
  attr_accessible :name, :phone, :state, :female, :birth_date
end
