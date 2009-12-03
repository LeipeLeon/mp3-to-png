#!/usr/bin/env ruby
# mpg123 -d 192 -O file.raw -m 2009-11-15-1830.mp3
# ./wave_file.rb file.raw

@data = []
@input_type = "File"
@image_file = "generated_from_file.png"

File.open('file.raw') do |file|
  while !file.eof?
    first_channel_data, second_channel_data = file.read(4).unpack('ss')
    @data << first_channel_data
  end
end

require 'process'
