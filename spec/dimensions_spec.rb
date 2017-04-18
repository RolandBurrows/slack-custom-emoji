require 'spec_helper'

describe 'Emoji dimensions' do

  it 'conform to length, width, size, and type requirements' do
    Dir["./custom_emoji/*"].each { |emoji_image|
      puts "Verifying file (#{File.basename(emoji_image)})"
      # File type should be png or .gif ideally
      expect([".png", ".gif"]).to include(File.extname(emoji_image))
      # Files must have size less than 64kb
      expect(File.new(emoji_image).size).to be < 64000
      # Files must have width less than 128px
      expect(FastImage.size(emoji_image)[0]).to be <= 128
      expect(FastImage.size(emoji_image)[1]).to be <= 128
    }
  end

end
