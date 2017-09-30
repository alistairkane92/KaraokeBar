require "pry-byebug"
require_relative "guests"

class Rooms < Guests

    def initialize(name, guests, playlist, room_capacity)
        @name = name
        @guests = guests
        @playlist = playlist
        @room_capacity = room_capacity
        @entry_fee = 10
    end

    def playlist
        return @playlist
    end

    def number_of_songs
        return @playlist.length
    end

    def number_of_guests
        return @guests.length
    end

    def add_guest(name_of_guest)
        @guests << name_of_guest
    end

    def remove_guest(name_of_guest)
        for guest in @guests
            if name_of_guest == guest
                @guests.delete(guest)
            end
        end
    end

    def add_song_to_playlist(song_to_add)
        @playlist << song_to_add
    end

    def remove_song_from_playlist(song_to_remove)
        for song in @playlist
            if song_to_remove == song
                @playlist.delete(song)
            end
        end
    end

    def max_capacity
            if @guests.length < @room_capacity
                max_capacity = false
            else
                max_capacity = true
            end
        return max_capacity
    end

    def permit_guest(name_of_guest)
        while max_capacity != true && name_of_guest.money > @entry_fee
            @guests << name_of_guest
            name_of_guest.money == name_of_guest.money - @entry_fee
        end
    end

    def woo
        for song in @playlist

            for guest in @guests
                if guest.fav_song == song.name
                    return "Woo!"
                end
            end

        end
    end

    def money_taken
        total_fees = @entry_fee * @guests.length
        return total_fees
    end

end
