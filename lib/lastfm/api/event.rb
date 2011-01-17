module Lastfm
  class API
    module Event
      def events(options)
        response = get('geo.getevents', options)
        # TODO: move outside
        doc = Nokogiri::XML(response.body)
        doc.xpath('//event').each do |event|
          puts "Show: #{event.css('title').text}"
          puts "Artist: #{event.css('headliner').text}"
          event.css('venue') do |venue|
            place = [venue.css('name').text]
            venue.css('location') do |location|
              place << location.css('city').text + " - " + location.css('country').text
            end
            puts "Location: #{place.join(', ')}"
          end
          puts "Date: #{event.css('startDate').text}"
          puts '-'*30
        end
      end
    end
  end
end
