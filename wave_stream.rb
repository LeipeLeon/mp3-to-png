#!/usr/bin/env ruby

# mpg123 -s -d 192 2009-11-15-1830.mp3 | ./wave_stream.rb

require 'create_image'
require 'tempfile'

file = Tempfile.new('mp3analysis')
$stdin.each do |line|
  file.print(line)
end
file.flush
file.rewind
[4,16,32,64,128,256].each do |rate|
  t = Time.now
  data = []
  info = "Rate: %d" % rate
  input_type = "Stream @ #{rate}"
  image_file = "generated_from_stream_#{rate}.png"

  while !file.eof?
    first_channel_data, second_channel_data = file.read(rate).unpack('ss')
    data << first_channel_data
  end

  file.rewind

  puts data.inspect if ENV['DEBUG']
  info << ", Samples: %d" % data.length

  CreateImage.new(data, info, image_file, input_type)

  puts "Rate: %3d, Time taken: %02.2f sec" % [rate, Time.now - t]
end