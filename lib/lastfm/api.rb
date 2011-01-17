require File.expand_path('../api/event', __FILE__)
require File.expand_path('../api/version', __FILE__)

module Lastfm
  class API
    def get(method, options={})
      raise 'Not implemented'
    end

    include Lastfm::API::Event
  end
end

