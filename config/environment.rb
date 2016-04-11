# Load the Rails application.
require File.expand_path('../application', __FILE__)

require 'yaml'
APP_PASSWORDS = YAML.load(File.read(Rails.root.join("config", "passwords.yml")))

# Initialize the Rails application.
Rails.application.initialize!
