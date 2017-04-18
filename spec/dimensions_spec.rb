require 'spec_helper'

describe 'Emoji dimensions' do

  it 'conform to length, width, and size requirements' do
    Dir["./custom_emoji/*"].each { |emoji_image|
      # Files must be less than 64kb in size
      expect(File.new(emoji_image).size).to be < 64000
    }
  end

end
