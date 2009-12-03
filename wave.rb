#!/usr/bin/env ruby
# 
# Created by Leon Berenschot on 2009-12-03.
# Copyright (c) 2009 Wendbaar.nl. All rights reserved.
# 
# Usage:
# with an intermediate raw file
#   mpg123 -d 192 -O file.raw -m 2009-11-15-1830.mp3
#   ./wave.rb file.raw
# 
# inline on CLI
#   mpg123 -s -d 192 2009-11-15-1830.mp3 | ./wave.rb


require 'parse_data'

# this is not foolproof....
if $stdin.tty?
  type = 'CLI'
  fp = File.open(ARGV.first)
else
  type = 'Stream'
  require 'tempfile'
  fp = Tempfile.new('wave')
  $stdin.each { |line| fp.print(line) }
  fp.flush
  fp.rewind
end

ParseData.new(fp, type)
