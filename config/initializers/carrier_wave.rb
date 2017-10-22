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

  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAI7XJRYPQXNL2OVNA',
    aws_secret_access_key: '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',
    region: 'us-east-1 '
  }
  config.fog_directory  = 'tourifync'
  config.fog_public     = false
  config.fog_attributes = { cache_control: "public, max-age=#{365.day.to_i}" }
end
