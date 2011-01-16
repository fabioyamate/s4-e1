require 'test_helper'

class TestCli < MiniTest::Unit::TestCase
  def test_blank_command_show_how_to_get_more_information
    output = Lastfm::Cli.new([]).run
    assert_equal "lastfm: try 'lastfm --help' or 'lastfm -h' for more information", output
  end

  def test_help_information
    cli = Lastfm::Cli.new(%w(--help))

    assert cli.options[:help]
    assert_match /Usage: lastfm \[options\] <command>/, cli.run.to_s
  end

  def test_valid_command
    cli = Lastfm::Cli.new(%w(-l brazil events))

    assert_equal "brazil", cli.options[:location]
    assert_equal "called events", cli.run.to_s
  end
end
