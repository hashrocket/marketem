require 'active_record_spec_helper'
require 'contact'

describe Contact do
  it "requires a name" do
    Contact.new.should have(1).errors_on(:name)
  end

  it "requires a phone" do
    Contact.new.should have(1).errors_on(:phone)
  end

  it "requires a state" do
    Contact.new.should have(1).errors_on(:state)
  end

  it "requires a birth date" do
    Contact.new.should have(1).errors_on(:birth_date)
  end
end
