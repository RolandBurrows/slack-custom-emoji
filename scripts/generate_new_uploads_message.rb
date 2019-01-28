# Generate a "hey, I just uploaded all these new emoji" message

def generate_upload_message
  puts ''
  puts '> Initializing upload message generation'
  readme_table_string = ""
  readme_table_string << "Newly uploaded emoji:\n>>>\n"
  emoji_array = []
  puts '> Adding emoji to message'
  Dir["**/custom_emoji/*"].each { |emoji_image|
    emoji_array.push(emoji_image.sub("../", ""))
  }
  emoji_array.each { |emoji_entry|
    emoji_basename = File.basename(emoji_entry, ".*")
    readme_table_string << ":#{emoji_basename}: - `#{emoji_basename}`"
    readme_table_string << "\n"
  }
  puts '> Message compiled'
  return readme_table_string
end

def save_output_to_file(input)
  filename = 'upload_message.txt'
  puts "> Saving message to git-ignored file: (#{filename})"
  output_file = File.new(filename, "w+")
  File.open(output_file, "w") { |file| file.write(input) }
  output_file.close
end

save_output_to_file(generate_upload_message)
puts ''
