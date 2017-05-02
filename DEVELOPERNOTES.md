# Developer Notes

### General
What a fun challenge!

At first I was not going to use rails because it seemed like overkill, but in the end I wanted to test the experience with a feature test, and have a small bit of front end. Plus, I think Rails was the best choice because I love it and it is pretty fast.

I spent a good amount of time playing around with parsing the XML at first. We have mostly used JSON for the past 7 months, but I knew XML was out there. I ended up using `Hash.from_xml(xml_response)` as my solution rather than a library for xml parsing. It looked like [Nokogiri](https://github.com/sparklemotion/nokogiri) is actually the way to go for that, but I came upon the Hash solution and pushed forward.

Going forward, the number one thing I'd like to do is test more sad paths. This is not robustly tested, so I would like to verify the MIME type of the incoming information, test a few other rss feeds, and perhaps even a non-conforming feed.

During that process I will need to refactor my AudioService quite a bit. The matching_episodes might even become a PORO.

Also, the user experience should be improved by:
1. adding flash messages for unsuccessful downloads
2. make links to the audio files and a way to play them
3. even better: use AJAX calls to make this seamless for the user when adding files

Cleanup:
1. The `public/audio/test/1.mp3` file gets written over every time I run a test. I think it would be better/cleaner to configure database-cleaner to clean that directory up every time instead.

### Libraries used
I used [Faraday](https://github.com/lostisland/faraday) for my get requests.
