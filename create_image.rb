
require 'rubygems'
require 'gruff'

class CreateImage
  def initialize(data, info, image_file, input_type)
    g = Gruff::Line.new
    g.title = "Generated from #{input_type || '??' }"
    g.data(info || "Wave", data)
    g.write(image_file || 'my_graph.png')
  end
end