SHELL=/usr/bin/env bash

index:
	grep -n "	gene	" chunks/* | cut -d"	" -f1,9 | cut -d";" -f1 | tr = : | awk -v OFS="\t" -F":" '{print $$4, $$2, $$1}' > chunk_index.tsv