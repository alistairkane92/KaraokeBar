require 'minitest/autorun'
require 'minitest/rg'

require_relative '../guests'
require_relative '../rooms'

class TestGuests < MiniTest::Test

    def setup
        @guest1 = Guests.new("Michael", 50, "Total Eclipse of the Heart")
        @guest2 = Guests.new("Paul", 20, "Purple Rain")
        @guest3 = Guests.new("Freddie", 5, "Bohemian Rhapsody")

        @room1 = Rooms.new("Main Room", [], [], 3)
    end


    def test_name
        assert_equal("Paul", @guest2.name)
    end

    def test_money
        assert_equal(50, @guest1.money)
    end

    def test_fav_song
        assert_equal("Bohemian Rhapsody", @guest3.fav_song)
    end


    def test_paid_entry
        @guest1.pay_entry_fee

        assert_equal(40, @guest1.money)
    end

end
