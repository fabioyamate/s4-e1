Last.fm Command Line
====================

This is an implementation of a command line version to consume Last.fm
Geolocation API thru terminal.

Check `./bin/lastfm -h` to get more information about the command line.

APIs Available
--------------

Currently it's possible to retrieve data form Last.fm for the following
methods:

* getEvents (location): retrieve events from a specific location, ie. "boston"
* getTopArtists (country): retrieve a list of the top 50 most artists listened
  in the specified country
* getTopTracks (country [location]): retrieve a list of the top 50 most tracks
  listened in the specific country/location

Basic Usage
-----------

You will require a Last.fm API_KEY access to consume their API. So, you need to
create a Last.fm account and then request access to the API [1]

[1] http://www.last.fm/api/account

After that, you need to pass the api-key to the command line:

  $ ./bin/lastfm --api-key API_KEY --location boston events

Since you will need to pass the api key for every request, it's possible to
setup an ~/.lastfmrc with the api_key. For example:

~/.lastfmrc file
api_key: MY_API_KEY

So, you don't need to pass the --api-key option every time.

Output
------

Requesting Top Tracks from United States

  $ ./bin/lastfm -c "united states" top_tracks
  Results for Top Tracks in united states
  ---------------------------------------
  #1: All Of The Lights with 6288 listeners.
  #2: Hold It Against Me with 5543 listeners.
  #3: Dark Fantasy with 5541 listeners.
  #4: POWER with 5351 listeners.
  #5: Tighten Up with 4805 listeners.
  #6: Dog Days Are Over with 4706 listeners.
  #7: Little Lion Man with 4413 listeners.
  #8: Skinny Love with 4345 listeners.
  #9: Home with 4333 listeners.
  #10: Derezzed with 4211 listeners.
  #11: Ready to Start with 4070 listeners.
  #12: The Suburbs with 3991 listeners.
  #13: The Cave with 3885 listeners.
  #14: 1901 with 3824 listeners.
  #15: Hell Of A Life with 3817 listeners.
  #16: Sleepyhead with 3751 listeners.
  #17: Everlasting Light with 3570 listeners.
  #18: All Of The Lights (Interlude) with 3563 listeners.
  #19: Lisztomania with 3511 listeners.
  #20: We R Who We R with 3495 listeners.
  #21: Howlin' for You with 3463 listeners.
  #22: Kids with 3446 listeners.
  #23: Firework with 3444 listeners.
  #24: Sprawl II (Mountains Beyond Mountains) with 3400 listeners.
  #25: Electric Feel with 3341 listeners.
  #26: Modern Man with 3334 listeners.
  #27: Zebra with 3286 listeners.
  #28: Bad Romance with 3272 listeners.
  #29: Who Will Survive In America with 3254 listeners.
  #30: A-Punk with 3223 listeners.
  #31: Rococo with 3219 listeners.
  #32: The High Road with 3196 listeners.
  #33: Next Girl with 3179 listeners.
  #34: Norway with 3176 listeners.
  #35: VCR with 3162 listeners.
  #36: The Son of Flynn with 3157 listeners.
  #37: Teenage Dream with 3155 listeners.
  #38: Flume with 3134 listeners.
  #39: Time to Pretend with 3094 listeners.
  #40: We Used to Wait with 3088 listeners.
  #41: End of Line with 3019 listeners.
  #42: Oxford Comma with 2982 listeners.
  #43: Crystalised with 2972 listeners.
  #44: Sweet Disposition with 2966 listeners.
  #45: Winter Winds with 2917 listeners.
  #46: She's Long Gone with 2912 listeners.
  #47: The Game Has Changed with 2911 listeners.
  #48: The Grid with 2898 listeners.
  #49: Empty Room with 2897 listeners.
  #50: Recognizer with 2871 listeners.

Since the command uses STDO and STDIN, it is possible to use terminal commands
to it.

Like, retrieve the 2nd most listened track, you could use:

  $ ./bin/lastfm --country "united states" top_tracks | grep "#2"
  #2: Hold It Against Me with 5543 listeners.

