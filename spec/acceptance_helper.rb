# require normal spec_helper
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

# require acceptance support files
Dir["#{File.dirname(__FILE__)}/acceptance/support/**/*.rb"].each { |f| require f }
