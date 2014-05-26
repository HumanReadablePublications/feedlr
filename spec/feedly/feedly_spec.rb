require 'helper'
require 'logger'

describe Feedlr do
  let(:logger) { Logger.new(STDOUT) }

  after(:each) do
    Feedlr.oauth_access_token = nil
    Feedlr.sandbox = nil
    Feedlr.logger = nil
  end

  describe '::sandbox' do
    it 'should be in production mode if not set' do
      expect(Feedlr.sandbox).to eq(false)
    end

    it 'should be in sandbox mode if set' do
      Feedlr.configure { |c| c.sandbox = true }
      expect(Feedlr.sandbox).to eq(true)
    end
  end

  it 'should be able to set the oAuth access token,' \
  'sandbox and logger' do
    Feedlr.oauth_access_token  = 'oauth_access_token'
    Feedlr.sandbox = true
    Feedlr.logger = logger

    expect(Feedlr.oauth_access_token).to eq('oauth_access_token')
    expect(Feedlr.sandbox).to eq(true)
    expect(Feedlr.logger).to eq(logger)
  end

  describe '::configure' do
    it 'should be able to set the oAuth access token,' \
    'sandbox and logger via a configure block' do
      Feedlr.configure do |config|
        config.oauth_access_token  = 'oauth_access_token'
        config.sandbox = true
        config.logger = logger
      end

      expect(Feedlr.oauth_access_token).to eq('oauth_access_token')
      expect(Feedlr.sandbox).to eq(true)
      expect(Feedlr.logger).to eq(logger)
    end

    it 'should return true' do
      res = Feedlr.configure {}
      expect(res).to be_true
    end
  end
end
