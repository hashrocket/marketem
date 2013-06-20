class RecipientsController < ApplicationController

  def index
    render json: { recipients: Recipient.all }
  end

  def create
    Recipient.new.update_attributes(recipient_params)
    render status: :ok, nothing: true
  end

  private
  def recipient_params
    params.required(:recipient).permit!
  end

end
