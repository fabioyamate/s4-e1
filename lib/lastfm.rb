require 'rubygems'
require 'bundler/setup'
Bundler.require

require 'lastfm/api'
require 'lastfm/command'
require 'lastfm/client'

module Lastfm
  extend self

  def execute(args)
    Lastfm::Command.new(args).run
  end
end
