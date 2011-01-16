require 'optparse'

module Lastfm
  class Command
    attr_reader :options

    def initialize(argv)
      @argv = argv
      @options = {}
      parse_options
    end

    def run
      case @argv.last
      when 'events'
        'called events'
      else
        if @options[:help]
          opt_parser
        else
          "lastfm: try 'lastfm --help' or 'lastfm -h' for more information"
        end
      end
    end

    private

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
