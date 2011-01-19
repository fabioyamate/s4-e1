require 'optparse'

module Lastfm
  class Command
    attr_reader :options

    AVAILABLE_COMMANDS = %w(events top_artists)

    def initialize(argv)
      @argv = argv
      @options = {}
      parse_options
    end

    def run
      if AVAILABLE_COMMANDS.include?(@argv.last)
        client.send(@argv.last, @options)
      else
        if @options[:help]
          opt_parser
        else
          "lastfm: try 'lastfm --help' or 'lastfm -h' for more information"
        end
      end
    end

    private

    def client
      @client ||= Lastfm::Client.new
    end

    def parse_options
      opt_parser.parse!(@argv)
    end

    def opt_parser
      @opt_parser ||= OptionParser.new do |opt|
        opt.banner = 'Usage: lastfm [options] <command>'
        opt.separator ''
        opt.separator 'Commands'
        opt.separator '    events   # retrieve events from a specific location'
        opt.separator ''
        opt.separator 'Options'

        opt.on('-l', '--location LOCATION', '# location name') do |location|
          @options[:location] = location
        end

        opt.on('-c', '--country COUNTRY', '# country name') do |country|
          @options[:country] = country
        end

        opt.on('--api-key API', '# Last.fm API_KEY to user its services') do |api_key|
          @options[:api_key] = api_key
        end

        opt.on('-h', '--help', '# command line help') do |help|
          @options[:help] = help
        end
      end
    end
  end
end
