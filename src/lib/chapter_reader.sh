chapter_reader() {
	# Chapter page HTML
	chapter_content="$(gum spin --spinner line --show-output -- \
		curl --silent --request GET "${1}")"

	# Convert chapter HTML to GitHub Flavoured Markdown (closest to Honeyfeed)
	markdown="$(echo "${chapter_content}" |
		pup 'div.wrap-body.div' |
		html2md -i)"

	# Display stylised chapter in default pager (usually less)
	echo "${markdown}" | glow -w "$(tput cols)" -p -
}
