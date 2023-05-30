chapter_selection() {
	# Novel page HTML
	novel_page="$(gum spin --spinner line --show-output -- \
		curl --silent --get --data-urlencode "k=${args[title]}" "${1}")"

	# Chapter data
	IFS=$'\n' read -r -d '\n' -a chapter_locations <<<"$(echo "${novel_page}" |
		pup 'div.list-chapter a.list-group-item attr{href}')" || true
	IFS=$'\n' read -r -d '\n' -a chapter_names <<<"$(echo "${novel_page}" |
		pup 'div.list-chapter span.chapter-name text{}')" || true

	# Chapter collection for Gum
	chapters=""

	# Fix output format for Gum
	for ((i = 0; i < "${#chapter_locations[@]}"; i++)); do
		chapters+="$(printf "\nChapter $((i + 1)):%s" "${chapter_names[${i}]}")"
	done

	# Remove leading new-line
	chapters="$(echo "${chapters}" | sed '/./,$!d')"

	# Prompt for user's novel choice
	chapter_choice="$(echo "${chapters}" | gum filter)"

	# Remove chapter discriminator from chapter choice
	chapter_choice="${chapter_choice#Chapter [0-9]*: }"

	# Locate chapter choice location
	for ((i = 0; i < "${#chapter_locations[@]}"; i++)); do
		if [[ "${chapter_names[${i}]}" = " ${chapter_choice}" ]]; then
			chapter_location="https://www.honeyfeed.fm${chapter_locations[${i}]}"
		fi
	done

	# Return chapter location
	echo "${chapter_location}"
}
