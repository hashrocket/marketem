require 'active_record_spec_helper'
require 'contact'
require 'contact_fabricator'

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

  describe ".by_state" do
    it "returns contacts for a provided state" do
      contact1 = Fabricate(:contact, state: "FL")
      contact2 = Fabricate(:contact, state: "NY")
      Contact.by_state("FL").should == [contact1]
    end
  end
end
