# Load the Rails application.
require_relative "application"

# Load the app's custom environment variables here
app_environment_variables = File.join(Rails.root, 'config', 'env_vars.rb')
load(app_environment_variables) if File.exists?(app_environment_variables)

# Initialize the Rails application.
Rails.application.initialize!
