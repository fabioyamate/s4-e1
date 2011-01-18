require File.expand_path('../location', __FILE__)

module Lastfm
  module Data
    class Venue
      include HappyMapper

      element :name, String
      has_one :location, Location
      element :url, String

      def to_s
        [self.name, self.location].join(', ')
      end
    end
  end
end
