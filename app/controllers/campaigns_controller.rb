class CampaignsController < ApplicationController

  expose(:campaigns)
  expose(:campaign)
  expose(:contacts) { Contact.by_state(params[:campaign][:state]) }

  def create
    if campaign.save
      campaign.overwrite_recipients_with(contacts)
      redirect_to campaigns_path, notice: "Hooray! Your campaign was successfully added"
    else
      render :new
    end
  end

  def update
    if campaign.save
      campaign.overwrite_recipients_with(contacts)
      redirect_to campaigns_path, notice: "<strong>Hooray!</strong> Your campaign was successfully saved".html_safe
    else
      render :edit
    end
  end

end
