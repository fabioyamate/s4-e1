require File.expand_path('../configuration', __FILE__)

module Lastfm
  class Client < API
    include HTTParty
    base_uri 'http://ws.audioscrobbler.com/2.0'

    def initialize
      setup
    end

    def get(method, options={})
      query_options = {
        :method => method,
        :api_key => api_key
      }.merge(options)
      self.class.get('/', :query => query_options)
    end

    include Configuration
  end
end
