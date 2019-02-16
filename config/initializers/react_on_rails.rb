ReactOnRails.configure do |config|
  # This configures the script to run to build the production assets by webpack. Set this to nil
  # if you don't want react_on_rails building this file for you.
    config.build_production_command = "RAILS_ENV=production NODE_ENV=production bin/webpack"

    config.build_test_command = "RAILS_ENV=test bin/webpack"
    config.server_bundle_js_file = ""
end
