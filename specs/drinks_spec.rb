require 'minitest/autorun'
require 'minitest/rg'

require_relative "../drinks"

class TestDrinks < MiniTest::Test

    def setup
        @greygoose = Drinks.new("Greygoose", 50)
        @rumncoke = Drinks.new("RumnCoke", 10)
        @beer = Drinks.new("Beer", 5)
    end

    def test_name
        assert_equal("Beer", @beer.name)
    end

    def test_price
        assert_equal(5, @beer.price)
    end

end
