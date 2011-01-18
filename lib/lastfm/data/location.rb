module Lastfm
  module Data
    class Location
      include HappyMapper

      element :city, String
      element :country, String
      element :street, String
      element :postalcode, String
      element :timezone, String

      def to_s
        [self.city, self.country].join('/')
      end
    end
  end
end
