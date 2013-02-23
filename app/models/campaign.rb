class Campaign < ActiveRecord::Base
  attr_accessor :state
  attr_accessible :name, :postback_url, :message, :state
  validates :name, :postback_url, :message, presence: true
  has_many :campaign_recipients
  has_many :contacts, through: :campaign_recipients

  def overwrite_recipients_with(contacts)
    self.contacts = Array.wrap(contacts)
    save
  end
end
