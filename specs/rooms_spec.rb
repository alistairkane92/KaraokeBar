require 'minitest/autorun'
require 'minitest/rg'

require_relative '../rooms'
require_relative '../guests'
require_relative '../songs'

#could do a function that says the guest knows the artist but not the song
#and responds saying "I know who it is but I don't know the song"

#could do a list of names to do karaoke and have them rotate or move
#in order once one sings a song the next goes
#guest can have sing function and they will only sing their fav song
#if it is on the playlist

class TestRooms < MiniTest::Test

    def setup
        @room1 = Rooms.new("Main Room", [], [], 3)
        @room2 = Rooms.new("Second Room", [], [], 2)

        @guest1 = Guests.new("Michael", 50, "Total Eclipse of the Heart")
        @guest2 = Guests.new("Pauline", 30, "Purple Rain")
        @guest3 = Guests.new("Freddie", 25, "Bohemian Rhapsody")
        @guest4 = Guests.new("Mabel", 5, "Any old shite")
        @guest5 = Guests.new("KingPin", 3000, "Reggae shite")

        @song1 = Songs.new("Bohemian Rhapsody")
        @song2 = Songs.new("Purple Rain")
        @song3 = Songs.new("Total Eclipse of the Heart")

    end

    def test_name
        assert_equal("Main Room", @room1.name)
    end

    def test_number_of_guests
        assert_equal(0, @room1.number_of_guests)
    end

    def test_check_guests_in
        @room1.add_guest(@guest1)
        assert_equal(1, @room1.number_of_guests)
    end

    def test_check_guests_out
        @room1.add_guest(@guest1)

        @room1.remove_guest(@guest1)
        assert_equal(0, @room1.number_of_guests)
    end

    def test_add_song_to_playlist
        assert_equal(["Purple Rain"], @room1.add_song_to_playlist(@song2.name))
    end

    def test_remove_song
        @room1.add_song_to_playlist(@song1)

        @room1.remove_song_from_playlist(@song1)
        assert_equal(0, @room1.number_of_songs )
    end

    def test_permit_guests_and_remove_money
        @room1.permit_guest(@guest1)

        assert_equal(40, @guest1.money)
    end

    def test_max_capacity
        @room1.add_guest(@guest1)
        @room1.add_guest(@guest2)
        @room1.add_guest(@guest3)

        assert_equal(true, @room1.max_capacity)
    end

    def test_too_many_guests
        @room1.permit_guest(@guest1)
        @room1.permit_guest(@guest2)
        @room1.permit_guest(@guest3)
        @room1.permit_guest(@guest4)
        @room1.permit_guest(@guest5)

        assert_equal(3, @room1.number_of_guests)
    end


    def test_not_enough_money
        @room1.permit_guest(@guest4)

        assert_equal(0, @room1.number_of_guests)
    end

    def test_woo
        @room1.add_song_to_playlist(@song1)
        @room1.permit_guest(@guest3)

        assert_equal("Woo!", @room1.woo)
    end

    def test_money_taken
        @room1.permit_guest(@guest1)
        @room1.permit_guest(@guest2)
        @room1.permit_guest(@guest3)

        assert_equal(30, @room1.money_taken)
    end

end
