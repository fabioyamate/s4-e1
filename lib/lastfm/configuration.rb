module Lastfm
  module Configuration
    attr_accessor :api_key

    def setup
      self.api_key = config['api_key']
      self
    end

    def config
      @config ||= begin
                    YAML::load(config_file)
                  rescue
                    {}
                  end
    end

    protected

    def config_file
      File.open(File.join(Dir.home, '.lastfmrc'))
    end

  end
end
