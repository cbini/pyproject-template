#!/bin/bash

for input_file in $(tree -af -I ".git|.trunk" --gitignore --noreport -F -i); do
	if [[ -f "${input_file}" ]] && [[ "${input_file}" =~ \.tmpl$ ]]; then
		echo "Processing file: ${input_file}"
		# gomplate \
		# 	-f "${input_file}" \
		# 	-o "${input_file}" \
		# 	--left-delim "<<[" \
		# 	--right-delim "]>>" \
		# 	-c cus=./customize.json
	elif [[ -d "${input_file}" ]] && [[ "${input_file}" =~ \.tmpl/*$ ]]; then
        echo "Processing directory: ${input_file}"
    fi
done

# Clean up / implode
# rm README.md
# mv README_TEMPLATE.md README.md
# mv github .github
# rm customize
