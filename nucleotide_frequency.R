# nucleotide_frequency.R
library(seqinr)

calculate_nucleotide_frequency <- function(fasta_file) {
  seq <- read.fasta(fasta_file, seqtype = "DNA")
  seq <- unlist(seq)
  
  freq <- table(tolower(seq))
  barplot(freq, main = "Nucleotide Frequency", xlab = "Nucleotide", ylab = "Frequency", col = c("blue", "red", "green", "purple"))
}

args <- commandArgs(trailingOnly = TRUE)
calculate_nucleotide_frequency(args[1])
