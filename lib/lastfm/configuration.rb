module Lastfm
  module Configuration
    attr_accessor :api_key

    def setup
      self.api_key = config['api_key']
      self
    end

    def config
      @config ||= File.exists?(config_file) ? YAML::load_file(config_file) : {}
    end

    protected

    def config_file
      File.join(Dir.home, '.lastfmrc')
    end
  end
end
