require File.expand_path('../artists', __FILE__)
require File.expand_path('../venue', __FILE__)

module Lastfm
  module Data
    class Event
      include HappyMapper

      element :id, Integer
      element :title, String
      has_one :artists, Artists
      has_one :venue, Venue
      element :startDate, DateTime
      element :startTime, Time
      element :description, String
    end
  end
end
