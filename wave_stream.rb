#!/usr/bin/env ruby

# mpg123 -s -d 192 2009-11-15-1830.mp3 | ./wave_stream.rb

@data = []
@input_type = "Stream"
@image_file = "generated_from_stream.png"

$stdin.each do |line| 
  line.scan(/..../).each do |var| # is this the right way?
    first_channel_data, second_channel_data = var.unpack('ss')
    @data << first_channel_data
  end
end

require 'process'
