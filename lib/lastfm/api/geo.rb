require File.expand_path('../../data/event', __FILE__)
require File.expand_path('../../data/artist', __FILE__)
require File.expand_path('../../data/track', __FILE__)

module Lastfm
  class API
    module Geo
      def events(options)
        response = get('geo.getevents', options)
        events = Lastfm::Data::Event.parse(response.body)
        output = ["Results for Events at #{options[:location]}"]
        output << "-"*output.first.length
        events.each do |event|
          event_date = event.startDate.strftime('%Y-%m-%d (%a)')
          output << "#{event_date}: #{event.title}"
          output << "#{' '*(event_date.length + 1)} by #{event.artists.headliner} at #{event.venue}"
        end
        output.join("\n")
      end

      def top_artists(options)
        response = get('geo.gettopartists', options)
        artists = Lastfm::Data::Artist.parse(response.body)
        output = ["Results for Top Albums in #{options[:country]}"]
        output << "-"*output.first.length
        artists.each do |artist|
          output << "##{artist.rank}: #{artist.name} with #{artist.listeners} listeners."
        end
        output.join("\n")
      end

      def top_tracks(options)
        response = get('geo.gettoptracks', options)
        tracks = Lastfm::Data::Track.parse(response.body)
        output = ["Results for Top Tracks in #{options[:country]}"]
        output << "-"*output.first.length
        tracks.each do |track|
          output << "##{track.rank}: #{track.name} with #{track.listeners} listeners."
        end
        output.join("\n")
      end
    end
  end
end
