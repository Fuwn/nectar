# Search page HTML
search_page="$(gum spin --spinner line --show-output -- \
	curl --silent --get --data-urlencode "k=${args[title]}" \
	"https://www.honeyfeed.fm/search/novel_title")"

# Novel data
IFS=$'\n' read -r -d '\n' -a novel_locations <<<"$(echo "${search_page}" |
	pup 'div.novel-unit-type-h a.a-img-hover attr{href}')" || true
IFS=$'\n' read -r -d '\n' -a novel_names <<<"$(echo "${search_page}" |
	pup 'h3.novel-name text{}')" || true
# IFS=$'\n' read -r -d '\n' -a novel_update_dates <<<"$(echo "${search_page}" |
# 	pup 'div.information-unit-novel span:not([class]) text{}')" || true
# IFS=$'\n' read -r -d '\n' -a novel_chapter_counts <<<"$(echo "${search_page}" |
# 	pup 'div.information-unit-novel div.flex div:not([class]) text{}')" || true
# IFS=$'\n' read -r -d '\n' -a novel_statuses <<<"$(echo "${search_page}" |
# 	pup 'div.information-unit-novel div.flex div.wrap-publish-status text{}')" ||
# 	true

# Novel collection for Gum
novels=""

# Fix output format for Gum
for ((i = 0; i < "${#novel_locations[@]}"; i++)); do
	novels+="$(printf "\n%s" "${novel_names[${i}]}")"
done

# Remove leading new-line
novels="$(echo "${novels}" | sed '/./,$!d')"

# Prompt for user's novel choice
novel_choice="$(echo "${novels}" | gum filter)"

# Locate novel choice location
for ((i = 0; i < "${#novel_locations[@]}"; i++)); do
	if [[ "${novel_names[${i}]}" = "${novel_choice}" ]]; then
		novel_location="https://www.honeyfeed.fm${novel_locations[${i}]}"
	fi
done

# Obtain user's chapter choice
chapter_location="$(chapter_selection "${novel_location}")"

# Display chapter
chapter_reader "${chapter_location}"
