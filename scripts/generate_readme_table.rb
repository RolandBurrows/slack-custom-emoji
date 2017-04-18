
def generate_readme_table
  readme_table_string = ""
  readme_table_string << "| Emoji | Suggested Text | Emoji | Suggested Text | Emoji | Suggested Text |\n"
  readme_table_string << "|:-----:|:--------------:|:-----:|:--------------:|:-----:|:--------------:|\n"
  emoji_array = []
  Dir["../custom_emoji/*"].each { |emoji_image|
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
  return readme_table_string
end

def save_output_to_file(input)
  output_file = File.new("readme_table.txt", "w+")
  File.open(output_file, "w") { |file| file.write(input) }
  output_file.close
end

save_output_to_file(generate_readme_table)
