class CampaignRecipient < ActiveRecord::Base
  belongs_to :contact
  belongs_to :campaign
end
