module Lastfm
  module Data
    class Artist
      include HappyMapper

      attribute :rank,    Integer
      element :name,      String
      element :listeners, Integer
      element :url,       String
    end
  end
end
