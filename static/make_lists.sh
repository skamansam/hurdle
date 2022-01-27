#!/bin/bash

# combine all the wordlists
cat wordlists/*.txt | uniq -u | sort > combined.txt

mkdir -p by_length
LONGEST_WORD_COUNT=`wc -L wordlists/TWL06.txt | cut -f1 -d' '`

for i in $(seq 1 $LONGEST_WORD_COUNT)
do
  cat combined.txt | grep -x ".\{$i\}" > by_length/$i.txt
done
