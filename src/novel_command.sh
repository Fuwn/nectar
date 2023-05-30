# Obtain user's chapter choice
chapter_location="$(chapter_selection "https://www.honeyfeed.fm/novels/${args[id]}")"

# Display chapter
chapter_reader "${chapter_location}"
