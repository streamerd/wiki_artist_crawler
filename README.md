# WikiArtistCrawler

Demanding events are not only a case for artists or bands that are alive and active. 

Tribute concerts indeed considered to remember those that are resting in peace.

```

iex(33)> ArtistCareerStatus.is_tributable?("Édith Piaf")
true

iex(33)> ArtistCareerStatus.is_tributable?("Amy Winehouse")
true

iex(9)> ArtistCareerStatus.is_tributable?("Cem Karaca")
true

iex(33)> ArtistCareerStatus.is_tributable?("Jimi Hendrix")
true
iex(10)> ArtistCareerStatus.is_tributable?("Baris Manco")
true

iex(33)> ArtistCareerStatus.is_tributable?("Kurt Kobain")
true

```