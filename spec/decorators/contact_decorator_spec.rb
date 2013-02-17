require 'phony'
require 'active_support/time'
require 'base_decorator'
require 'contact_decorator'

describe ContactDecorator do
  let(:contact) { double }
  let(:decorator) { described_class.new(contact) }

  describe "#age" do
    it "returns age from the birthdate" do
      contact.stub(birth_date: 22.years.ago)
      decorator.age.should == 22
    end
  end

  describe "#gender" do
    it "retuns 'Male' when female is false" do
      contact.stub(female: false)
      decorator.gender.should == "Male"
    end
    it "returns 'Female' when female is true" do
      contact.stub(female: true)
      decorator.gender.should == "Female"
    end
  end

  describe "#phone" do
    it "returns a formated phone number" do
      contact.stub(phone: "19041231234")
      decorator.phone.should == "904-123-1234"
    end
  end

end
