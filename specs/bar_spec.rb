require 'minitest/autorun'
require 'minitest/rg'
require 'pry-byebug'

require_relative '../rooms'
require_relative '../bar'

class TestBar < MiniTest::Test

    def setup
        @bar1 = Bar.new([])

        @greygoose = Drinks.new("Greygoose", 50)
        @rumncoke = Drinks.new("RumnCoke", 10)
        @beer = Drinks.new("Beer", 5)

        @room1 = Rooms.new("Main Room", [], [], 3)
        @room2 = Rooms.new("Second Room", [], [], 2)

        @guest1 = Guests.new("Michael", 50, "Total Eclipse of the Heart")
        @guest2 = Guests.new("Pauline", 30, "Purple Rain")
        @guest3 = Guests.new("Freddie", 25, "Bohemian Rhapsody")
        @guest4 = Guests.new("Mabel", 5, "Any old shite")
        @guest5 = Guests.new("KingPin", 3000, "Eminemineminem")
    end

    def test_add_drink_to_bar
        assert_equal([@greygoose], @bar1.add_drink_to_bar(@greygoose))
    end

    def test_remove_drink_from_bar
        @bar1.add_drink_to_bar(@greygoose)
        @bar1.remove_drink_from_bar(@greygoose)

        assert_equal([], @bar1.bar_drinks)
    end

    def test_remove_money_from_customer
        actual = @bar1.remove_money_from_customer(@guest1, @beer)

        assert_equal(45, actual)
    end

    # def test_bar_sells_drink
    #
    #     @bar1.add_drink_to_bar(@greygoose)
    #
    #     @bar1.sell_drink(@greygoose, @guest1)
    #
    #     assert_equal(0, @bar1.number_of_drinks)
    #     assert_equal(1, @guest1.held_drinks.length)
    #     assert_equal(0, @guest1.money)
    # end

    def test_not_enough_money

        @bar1.add_guest(@guest2)

        @bar1.add_drink_to_bar(@greygoose)

        @bar1.sell_drink(@greygoose, @guest2)

        assert_equal([], @guest2.held_drink)
        assert_equal([], @bar1.number_of_guests)

    end




end
