class CampaignRecipients < ActiveRecord::Migration
  def change
    create_table :campaign_recipients do |t|
      t.references :campaign
      t.references :contact
    end
  end
end
