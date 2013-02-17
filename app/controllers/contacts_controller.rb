class ContactsController < ApplicationController
  expose(:contacts) { ContactDecorator.decorate(Contact.all) }
end
