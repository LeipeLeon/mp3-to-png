mp3 to png
==========

Requirements:

    gruff (gem)
    mpg123 (cli tool)

Generate raw file
=================

With an intermediate raw file

    mpg123 -d 192 -O file.raw 2009-11-15-1830.mp3
    ./wave.rb file.raw

Inline on CLI

    mpg123 -s -d 192 2009-11-15-1830.mp3 | ./wave.rb

Some expolanation on `mpg123` options: (see also `mpg123 --longhelp`)

	-d n   --doublespeed n    play only every nth frame
	-s     --stdout           write raw audio to stdout (host native format)
	-O                        raw output filename

ToDo:
=====

* wrap it up in tests
* Using gruff for the moment, maybe we get some inprovements when we're using RMagic directly (not sure)

Some Stats
==========

Some outputted [examples](http://github.com/LeipeLeon/mp3-to-png/tree/master/examples/)

The lower the rate, the more samples are used. But this also makes the waveform less dense.

	Rate:    4, Time taken: 13.44 sec
	Rate:   16, Time taken: 3.68 sec
	Rate:   32, Time taken: 1.94 sec
	Rate:   64, Time taken: 0.95 sec
	Rate:  128, Time taken: 0.50 sec
	Rate:  256, Time taken: 0.35 sec
	Rate:  512, Time taken: 0.20 sec
	Rate: 1024, Time taken: 0.12 sec
	Rate: 2048, Time taken: 0.08 sec

![example at a rate of 4    ](http://wendbaar.nl/github/generated_from_file_0004.png "Rate of 4")
![example at a rate of 512  ](http://wendbaar.nl/github/generated_from_file_0512.png "Rate of 512")
![example at a rate of 2048 ](http://wendbaar.nl/github/generated_from_file_2048.png "Rate of 2048")
![example at a rate of 16384](http://wendbaar.nl/github/generated_from_file_16384.png "Rate of 16384")
![example at a rate of 32768](http://wendbaar.nl/github/generated_from_file_32768.png "Rate of 32768")

More reading:
==========

Inside the MP3 Codec: [Frames](http://www.mp3-converter.com/mp3codec/frames.htm) 


---

Created by Leon Berenschot  
Copyright (c) 2009 Wendbaar.nl. All rights reserved.
