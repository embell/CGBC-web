CarrierWave.configure do |config|
  if ENV['RAILS_ENV'] == 'production'
    config.root = ENV['DATA_DIR']
  end
end
