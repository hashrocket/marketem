class ContactDecorator < BaseDecorator

  def age
    Time.now.year - birth_date.year
  end

  def gender
    female ? 'Female' : 'Male'
  end

  def phone
    Phony.formatted(super, spaces: '-').sub('+1-', '')
  end

end
