#!/usr/bin/env ruby

# mpg123 -s -d 192 2009-11-15-1830.mp3 | ./wave_stream.rb

require 'create_image'

rate = 4

data = []
info = "Rate: %d" % rate
input_type = "Stream @ #{rate}"
image_file = "generated_from_stream_#{rate}.png"

t = Time.now

file=$stdin


while !file.eof?
  first_channel_data, second_channel_data = file.read(rate).unpack('ss')
  data << first_channel_data
end

info << ", Samples: %d" % data.length

CreateImage.new(data, info, image_file, input_type)
puts "Time taken: %d" % [Time.now - t]
