require File.expand_path('../../data/event', __FILE__)

module Lastfm
  class API
    module Event
      def events(options)
        response = get('geo.getevents', options)
        events = Lastfm::Data::Event.parse(response.body)
        output = []
        events.each do |event|
          event_date = event.startDate.strftime('%Y-%m-%d (%a)')
          output << "#{event_date}: #{event.title}"
          output << "#{' '*(event_date.length + 1)} by #{event.artists.headliner} at #{event.venue}"
        end
        output.join("\n")
      end
    end
  end
end
