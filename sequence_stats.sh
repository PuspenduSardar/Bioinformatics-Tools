#!/bin/bash

# Usage: bash sequence_stats.sh <input.fasta>
file="$1"

# Initialize counters
seq_count=0
total_length=0
gc_count=0

while read line; do
    if [[ $line == ">"* ]]; then
        seq_count=$((seq_count + 1))
    else
        line_length=${#line}
        total_length=$((total_length + line_length))
        gc_count=$((gc_count + $(grep -o "[GCgc]" <<< "$line" | wc -l)))
    fi
done < "$file"

gc_content=$(echo "scale=2; $gc_count / $total_length * 100" | bc)

echo "Number of sequences: $seq_count"
echo "Total length: $total_length"
echo "GC content: $gc_content%"
