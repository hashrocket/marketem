class CampaignsController < ApplicationController

  expose(:campaign)

  def create
    if campaign.save
      redirect_to campaigns_path, notice: "Hooray! Your campaign was successfully added"
    else
      render :new
    end
  end

end
