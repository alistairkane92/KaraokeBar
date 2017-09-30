require_relative('drinks')
require('pry-byebug')



#could do a drunk kicked out and a no money kicked out bouncer function
#if the guest has no money || guest has too many drinks
#remove guest

class Bar < Rooms

    def initialize(bar_drinks)
        @bar_drinks = bar_drinks
    end

    def bar_drinks
        return @bar_drinks
    end

    def add_drink_to_bar(which_drink)
        @bar_drinks << which_drink
    end

    def remove_drink_from_bar(which_drink)
        @bar_drinks.delete(which_drink)
    end

    def number_of_drinks
        @bar_drinks.length
    end


    def remove_money_from_customer(guest, drink)
        guest.money - drink.price
    end

    def sell_drink(drink, guest)
        if guest.money >= drink.price && guest.held_drinks.length < 3
            remove_money_from_customer(guest, drink)
            remove_drink_from_bar(drink)
            guest.held_drinks << drink
        else
            remove_guest(guest)
        end
    end




end
