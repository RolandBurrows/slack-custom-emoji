
def generate_readme_table
  puts ''
  puts '> Initializing readme table generation'
  readme_table_string = ""
  readme_table_string << "| Emoji | Suggested Text | Emoji | Suggested Text | Emoji | Suggested Text |\n"
  readme_table_string << "|:-----:|:--------------:|:-----:|:--------------:|:-----:|:--------------:|\n"
  emoji_array = []
  puts '> Adding emoji to table'
  Dir["**/custom_emoji/*"].each { |emoji_image|
    emoji_array.push(emoji_image.sub("../", ""))
  }
  emoji_array.each_slice(3) { |section|
    section.each { |emoji_entry|
      emoji_basename = File.basename(emoji_entry, ".*")
      readme_table_string << "| <img src=\"#{emoji_entry}\" width=\"32\" height=\"32\"/> | :#{emoji_basename}: |"
    }
    readme_table_string << "\n"
    readme_table_string.gsub!("||", "|")
  }
  puts '> Table compiled'
  return readme_table_string
end

def save_output_to_file(input)
  filename = 'readme_table.txt'
  puts "> Saving table to file to git-ignored file: (#{filename})"
  output_file = File.new(filename, "w+")
  File.open(output_file, "w") { |file| file.write(input) }
  output_file.close
end

save_output_to_file(generate_readme_table)
puts ''
