#!/usr/bin/env ruby
# mpg123 -d 192 -O file.raw -m 2009-11-15-1830.mp3
# ./wave_file.rb file.raw

@rate = 4

@data = []
@info = ""
@input_type = "File"
@image_file = "generated_from_file_#{@rate}.png"
@info << "Rate: %d" % @rate

File.open('file.raw') do |file|
  while !file.eof?
    first_channel_data, second_channel_data = file.read(@rate).unpack('ss')
    @data << first_channel_data
  end
end
puts @data.inspect
@info << ", Samples: %d" % @data.length
require 'process'

`open generated_from_file_#{@rate}.png`