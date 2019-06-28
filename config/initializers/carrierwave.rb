CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:  'AWS',                        # required
    aws_access_key_id:  ENV['ACCESS_KEY_ID'],                        # required unless using use_iam_profile
    aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],                        # required unless using use_iam_profile
    region: 'us-west-2',                 # optional, defaults to 'us-east-1'
  }
   config.fog_directory  = 'funnel-images-test' 
   config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
end
