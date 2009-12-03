mp3 to png
==========

Requirements:

* [mpg123](http://www.mpg123.de/) (cli tool, on OSX install with `sudo port install mpg123`)
* [gruff](http://nubyonrails.com/pages/gruff) (gem)

Generate raw file
=================

With an intermediate raw file

    mpg123 -d 192 -O file.raw 2009-11-15-1830.mp3
    ./wave.rb file.raw

Inline on CLI

    mpg123 -s -d 192 2009-11-15-1830.mp3 | ./wave.rb

Some explanation on `mpg123` options: (see also `mpg123 --longhelp`)

	-d n   --doublespeed n    play only every nth frame
	-s     --stdout           write raw audio to stdout (host native format)
	-O                        raw output filename

ToDo:
=====

* wrap it up in tests
* Using gruff for the moment, maybe we get some inprovements when we're using RMagic directly (not sure)

Some Stats
==========

Some outputted [examples](http://wendbaar.nl/github/)

(test done with a 24 kbit/s, 24000 Hz mono file)

The higher the rate, the less samples are used. This also makes the waveform less dense.

	Rate:    4, Time taken to generate image: 13.44 sec
	Rate:   16, Time taken to generate image: 3.68 sec
	Rate:   32, Time taken to generate image: 1.94 sec
	Rate:   64, Time taken to generate image: 0.95 sec
	Rate:  128, Time taken to generate image: 0.50 sec
	Rate:  256, Time taken to generate image: 0.35 sec
	Rate:  512, Time taken to generate image: 0.20 sec
	Rate: 1024, Time taken to generate image: 0.12 sec
	Rate: 2048, Time taken to generate image: 0.08 sec

![example at a rate of 4    ](http://wendbaar.nl/github/generated_from_file_0004.png "Rate of 4")
![example at a rate of 512  ](http://wendbaar.nl/github/generated_from_file_0512.png "Rate of 512")
![example at a rate of 2048 ](http://wendbaar.nl/github/generated_from_file_2048.png "Rate of 2048")
![example at a rate of 16384](http://wendbaar.nl/github/generated_from_file_16384.png "Rate of 16384")
![example at a rate of 32768](http://wendbaar.nl/github/generated_from_file_32768.png "Rate of 32768")

More reading:
==========

* [Inside the MP3 Codec: Frames](http://www.mp3-converter.com/mp3codec/frames.htm)  
* [Rendering an mp3 as a waveform image in ruby??](http://www.ruby-forum.com/topic/160681#new)

---

Created by Leon Berenschot  
Copyright (c) 2009 Wendbaar.nl. All rights reserved.
