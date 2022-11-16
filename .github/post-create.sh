#!/bin/bash

echo "Processing src directory"
mv src/.tmpl src/"${FOO}"

for tmpl_in in $(tree -af -I ".git|.trunk" --gitignore --noreport -F -i); do
	if [[ -f ${tmpl_in} ]] && [[ ${tmpl_in} =~ \.tmpl$ ]]; then
		tmpl_out=${tmpl_in%.*}

		echo "Processing file: ${tmpl_in} => ${tmpl_out}"
		envsubst <"${tmpl_in}" >"${tmpl_out}"
	fi

	rm "${tmpl_in}"
done
