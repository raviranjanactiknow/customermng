CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJS6VEGKMD44ST3IA',                        # required unless using use_iam_profile
    aws_secret_access_key: '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',                        # required unless using use_iam_profile
    region:                'us-west-2',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'funnel-images-test'                                      # required
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
end
