#!/usr/bin/env ruby
# mpg123 -d 192 -O file.raw -m 2009-11-15-1830.mp3
# ./wave_file.rb file.raw

require 'create_image'
require 'parse_data'

infile = ARGV.first || 'file.raw'
file = File.open(infile)




ParseData.new(file, 'File')


# `open generated_from_file_#{@rate}.png`  

# ./wave_file.rb
# Rate:   4, Time taken: 19.67 sec
# Rate:  16, Time taken: 5.77 sec
# Rate:  32, Time taken: 3.33 sec
# Rate:  64, Time taken: 1.74 sec
# Rate: 128, Time taken: 1.05 sec
# Rate: 256, Time taken: 0.67 sec
