#!/usr/bin/env ruby

# mpg123 -s -d 192 2009-11-15-1830.mp3 | ./wave_stream.rb

require 'create_image'

rate = 4

data = []
info = "Rate: %d" % rate
input_type = "Stream"
image_file = "generated_from_stream_#{rate}.png"

t = Time.now

# file=$stdin

$stdin.each do |line| 
  line.scan(/^.{4}/).each do |var| # is this the right way?
    first_channel_data, second_channel_data = var.unpack('ss')
    data << first_channel_data
  end
end

info << ", Samples: %d" % data.length

CreateImage.new(data, info, image_file, input_type)
puts "Time taken: %d" % [Time.now - t]
