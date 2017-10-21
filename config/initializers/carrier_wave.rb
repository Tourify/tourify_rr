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
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAI7XJRYPQXNL2OVNA',
    :aws_secret_access_key  => '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',
    :region                 => 'us-east-1 '
    # based on the URL, our region may actually be: us-east-2....cuz: https://console.aws.amazon.com/iam/home?region=us-east-2#/home
  }
  config.fog_directory  = 'tourifync'               # required
  #config.fog_host       = 'https://assets.example.com'           # optional, defaults to nil
  #config.fog_public     = false                                  # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
