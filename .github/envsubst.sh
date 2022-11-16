#!/bin/bash

if [[ -d src/.tmpl ]]; then
	echo "Processing src directory"
	mv src/.tmpl src/"${GITHUB_REPOSITORY_NAME}"
fi

for tmpl_in in $(tree -af -I ".git|.trunk" --gitignore --noreport -F -i); do
	if [[ -f ${tmpl_in} ]] && [[ ${tmpl_in} =~ \.tmpl$ ]]; then
		tmpl_out=${tmpl_in%.*}

		echo "Processing file: ${tmpl_in} => ${tmpl_out}"
		envsubst <"${tmpl_in}" >"${tmpl_out}"
	fi

	if [[ ${tmpl_out} == "./README.md" ]]; then
		# make README the docs index
		cp README.md doc/index.md
	fi

	rm "${tmpl_in}"
done
