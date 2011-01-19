module Lastfm
  module Data
    class Track
      include HappyMapper

      attribute :rank,    Integer
      element :name,      String
      element :listeners, Integer
    end
  end
end
