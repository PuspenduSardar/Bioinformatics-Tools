# Bioinformatics Tools
### Author: Puspendu Sardar, Ph.D., Deprtment of Medicine, University of Cambrodge

This repository contains scripts for basic bioinformatics analyses and utilities.

## Tools Included

1. **sequence_stats.sh**: Bash script to calculate sequence statistics from a FASTA file.
   - Usage: `bash sequence_stats.sh <input.fasta>`

2. **nucleotide_frequency.R**: R script to generate a nucleotide frequency bar plot.
   - Usage: `Rscript nucleotide_frequency.R <input.fasta>`
   
3. **fastq_stats.py**: Calculates basic statistics for FASTQ files.
   - Usage: `python fastq_stats.py <input.fastq>`

4. **alpha_diversity.R**: Calculates different diversity indices from species count data.
   - Usage: `Rscript alpha_diversity.R <count_data.tab> <diversity_results.txt>`

## Requirements
- **Python** 
- **R-packages** **seqinr**

## How to Clone and Run
```bash
git clone https://github.com/yourusername/bioinformatics-tools.git
cd bioinformatics-tools