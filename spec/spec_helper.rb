require_relative '../config/environment'
Bundler.require(:test)

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'default'
end