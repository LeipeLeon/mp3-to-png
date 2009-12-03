
require 'rubygems'
require 'gruff'

class CreateImage
  def initialize(data, info, image_file, input_type)
    g = Gruff::Line.new("800x150", false)
    # g.theme = {
    #   :colors => ['#cccccc', 'white'], 
    #   :background_colors => ['black', 'black']
    # }
    g.theme_keynote
    # g.theme_37signals
    # g.theme_rails_keynote
    # g.theme_odeo
    # g.theme_pastel
    # g.theme_greyscale
    g.hide_dots = true
    g.hide_line_markers = true
    g.hide_legend       = true
    g.hide_title        = true
    g.hide_line_numbers = true
    g.margins = 0
    g.top_margin = 0
    g.legend_margin = 0
    g.title_margin = 0
    g.data(info || "Wave", data)
    # g.title = "Generated from #{input_type || '??' }"
    g.write(image_file || 'my_graph.png')
  end
end


