require 'test_helper'

class TestCli < MiniTest::Unit::TestCase
  def test_blank_command_show_how_to_get_more_information
    output = Lastfm::Command.new([]).run
    assert_equal "lastfm: try 'lastfm --help' or 'lastfm -h' for more information", output
  end

  def test_help_information
    cmd = Lastfm::Command.new(%w(--help))

    assert cmd.options[:help]
    assert_match /Usage: lastfm \[options\] <command>/, cmd.run.to_s
  end

  def test_valid_command
    cmd = Lastfm::Command.new(%w(-l brazil events))

    assert_equal "brazil", cmd.options[:location]
    assert_equal "called events", cmd.run.to_s
  end
end
