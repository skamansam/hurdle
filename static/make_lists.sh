#!/bin/bash

echo "Removing old files..."
rm by_length/*.txt

echo "sorting and combining files..."
sort -f wordlists/*.txt > combined.txt

echo "Lowercasing combined file..."
tr [:upper:] [:lower:] < combined.txt >combined_lower.txt

echo "Removing duplicate lines..."
cat combined_lower.txt | uniq -iu > combined.txt
rm combined_lower.txt

echo "removing non-alpha entries..."
gawk -i inplace '/^[a-zA-Z]+$/' combined.txt

mkdir -p by_length
LONGEST_WORD_COUNT=`wc -L combined.txt | cut -f1 -d' '`
echo "Found longest word: $LONGEST_WORD_COUNT"

for i in $(seq 1 $LONGEST_WORD_COUNT)
do
  cat combined.txt | grep -x ".\{$i\}" | sort -f | uniq -ui > by_length/$i.txt
  NUM_LINES=`wc -l by_length/$i.txt | cut -f1 -d ' '`
  echo "There are $NUM_LINES words of length $i."
  if (( $NUM_LINES < 100 )); then
    echo "    removing by_length/$i.txt"
    rm "by_length/$i.txt"
  fi
done
