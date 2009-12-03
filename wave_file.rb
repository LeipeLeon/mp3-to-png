#!/usr/bin/env ruby
# mpg123 -d 192 -O file.raw -m 2009-11-15-1830.mp3
# ./wave_file.rb file.raw

require 'create_image'

[4,16,32,64,128,256].each do |rate|
  t = Time.now
  data = []
  info = "Rate: %d" % rate
  input_type = "File @ #{rate}"
  image_file = "generated_from_file_#{rate}.png"

  File.open('file.raw') do |file|
    while !file.eof?
      first_channel_data, second_channel_data = file.read(rate).unpack('ss')
      data << first_channel_data
    end
  end
  puts data.inspect if ENV['DEBUG']
  info << ", Samples: %d" % data.length

  CreateImage.new(data, info, image_file, input_type)

  puts "Rate: %3d, Time taken: %02.2f sec" % [rate, Time.now - t]
end
# `open generated_from_file_#{@rate}.png`  

# ./wave_file.rb
# Rate:   4, Time taken: 19.67 sec
# Rate:  16, Time taken: 5.77 sec
# Rate:  32, Time taken: 3.33 sec
# Rate:  64, Time taken: 1.74 sec
# Rate: 128, Time taken: 1.05 sec
# Rate: 256, Time taken: 0.67 sec
