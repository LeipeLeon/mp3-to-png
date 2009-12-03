
class ParseData
  # SCAN_RATES = [4,16,32,64,128,256, 512]
  SCAN_RATES = [256, 512, 512 * 2]
  
  def initialize(fp, in_type = 'unknown')
    SCAN_RATES.each do |rate|
      t = Time.now
      data = []
      info = "Rate: %d" % rate
      input_type = "#{in_type} @ #{rate}"
      image_file = "generated_from_#{in_type.downcase}_#{"%04d" % rate}.png"

      while !fp.eof?
        first_channel_data, second_channel_data = fp.read(rate).unpack('ss')
        data << first_channel_data
      end

      fp.rewind

      puts data.inspect if ENV['DEBUG']
      info << ", Samples: %d" % data.length

      CreateImage.new(data, info, image_file, input_type)

      puts "Rate: %4d, Time taken: %02.2f sec" % [rate, Time.now - t]
    end
  end
end