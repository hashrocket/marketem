class BaseDecorator
  attr_reader :model

  def self.decorate(collection)
    collection.map do |item|
      new(item)
    end
  end

  def initialize(model)
    @model = model
  end

  def method_missing(sym, *args, &block)
    model.send(sym, *args, &block)
  end
end
