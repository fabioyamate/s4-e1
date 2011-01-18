module Lastfm
  module Data
    class Artists
      include HappyMapper

      has_many :artist, String
      element  :headliner, String
    end
  end
end
