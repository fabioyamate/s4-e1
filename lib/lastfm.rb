require 'rubygems'
require 'bundler/setup'
Bundler.require

require 'lastfm/command'

module Lastfm
  extend self

  def execute(args)
    Lastfm::Command.new(args).run
  end
end
