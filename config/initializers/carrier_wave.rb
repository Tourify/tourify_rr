CarrierWave.configure do |config|

  # Use local storage if in development or test
  if Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :file
    end
  end

  # Use AWS storage if in production
  if Rails.env.production?
    CarrierWave.configure do |config|
      config.storage = :fog
    end
  end

  config.fog_provider = 'fog/aws' 
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'access_key',
    aws_secret_access_key: 'secret_key',
    region: 'us-east-1 '
  }
  config.fog_directory  = 'tourifync'
  config.fog_public     = false
  config.fog_attributes = { cache_control: "public, max-age=#{365.day.to_i}" }
end
