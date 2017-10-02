class Guests

    def initialize(name, money, fav_song)
        @name = name
        @money = money
        @fav_song = fav_song
        @held_drinks = []
    end

    def name
        return @name
    end

    def money
        return @money
    end

    def fav_song
        return @fav_song
    end

    def held_drinks
        @held_drinks
    end

    def set_money(amount)
        @money -= amount
    end
end
