require 'helper'
require 'logger'

describe Feedlr::Client do

  describe '#sandbox' do
    it 'should default to Feedlr.sandbox if not set' do
      Feedlr.configure do |c|
        c.sandbox = false
        c.logger = nil
      end
      client = Feedlr::Client.new
      expect(client.sandbox).to eq(Feedlr.sandbox)
    end

    it 'should have a value when set' do
      client = Feedlr::Client.new(sandbox: true)
      expect(client.sandbox).to eq(true)
    end
  end

  describe '#oauth_access_token' do
    it 'should default to Feedlr.oauth_access_token if not set' do
      Feedlr.configure { |c| c.oauth_access_token = 'test' }
      client = Feedlr::Client.new
      expect(client.oauth_access_token).to eq(Feedlr.oauth_access_token)
    end

    it 'should be have a value when set' do
      client = Feedlr::Client.new(oauth_access_token: 'new_test')
      expect(client.oauth_access_token).to eq('new_test')
    end
  end

  describe '#logger' do
    it 'should default to Feedlr.logger if not set' do
      Feedlr.configure { |c| c.logger = Logger.new(STDOUT) }
      client = Feedlr::Client.new
      expect(client.logger).to eq(Feedlr.logger)
    end

    it 'should be have a value when set' do
      logger = Logger.new(STDOUT)
      client = Feedlr::Client.new(logger: logger)
      expect(client.logger).to eq(logger)
    end
  end

end
