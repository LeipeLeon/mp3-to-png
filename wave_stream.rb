#!/usr/bin/env ruby

# mpg123 -s -d 192 2009-11-15-1830.mp3 | ./wave_stream.rb

require 'create_image'
require 'parse_data'
require 'tempfile'

file = Tempfile.new('mp3analysis')
$stdin.each { |line| file.print(line) }
file.flush
file.rewind

ParseData.new(file, 'Stream')
