class Campaign < ActiveRecord::Base
  attr_accessible :name, :postback_url, :message
  validates :name, :postback_url, :message, presence: true
end
