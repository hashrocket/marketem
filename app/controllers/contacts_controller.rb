class ContactsController < ApplicationController
  expose(:contact)
  expose(:contacts)
  expose(:decorated_contacts) { ContactDecorator.decorate(contacts) }

  def create
    if contact.save
      redirect_to contacts_path, notice: "Hooray! Your contact was successfully added."
    else
      render :new
    end
  end

end
