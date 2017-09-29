require 'minitest/autorun'
require 'minitest/rg'

require_relative '../songs'


class TestSongs < MiniTest::Test
    def setup
        @song1 = Songs.new("Bohemian Rhapsody")
        @song2 = Songs.new("Purple Rain")
        @song3 = Songs.new("Total Eclipse of the Heart")

        @songs = [@song1, @song2, @song3]
    end

    def test_return_song_name
        assert_equal("Purple Rain", @song2.name)
    end
    

end
