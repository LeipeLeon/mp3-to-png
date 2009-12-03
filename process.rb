raise ArgumentError, "No data given" if @data.nil?

require 'rubygems'
require 'gruff'

g = Gruff::Line.new
g.title = "Generated from #{@input_type || '??' }"
g.data(@info || "Wave", @data)
g.write(@image_file || 'my_graph.png')
