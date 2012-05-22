require 'rspec'
require 'project-synch'

SPEC_DIR = File.dirname(__FILE__)

module Rails
  def self.root
    File.join SPEC_DIR, 'dummy-app'
  end
end

require 'rails_config_loader'
require 'singleton'

def structure
  App.instance
end

class App
  include Singleton
  include ConfigLoader::Delegator

  def config
    @config ||= load_hash 'project_structure.yml'
  end
end

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  
end
