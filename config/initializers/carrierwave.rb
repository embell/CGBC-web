CarrierWave.configure do |config|
  if ENV['RAILS_ENV'] == 'production'
    config.root = ENV['OPENSHIFT_DATA_DIR']
  end
end
