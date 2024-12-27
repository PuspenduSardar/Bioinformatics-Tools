# alpha_diversity.R
calculate_alpha_diversity <- function(count_data) {
    if (sum(count_data) == 0) {
        return(list(
            "Richness" = NA,
            "Chao1" = NA,
            "Shannon" = NA,
            "Simpson" = NA,
            "Inverse_Simpson" = NA
        ))  # Handle edge case of zero counts
    }
    
    proportions <- count_data / sum(count_data)
    
    # Richness (Observed OTUs)
    richness <- sum(count_data > 0)
    
    # Chao1 Estimator
    singletons <- sum(count_data == 1)
    doubletons <- sum(count_data == 2)
    chao1 <- richness + (singletons^2 / (2 * doubletons + 1e-12))
    
    # Shannon Diversity Index
    shannon <- -sum(proportions * log(proportions + 1e-12))
    
    # Simpson Diversity Index
    simpson <- 1 - sum(proportions^2)
    
    # Inverse Simpson Index
    inverse_simpson <- 1 / sum(proportions^2)
    
    return(list(
        "Richness" = richness,
        "Chao1" = chao1,
        "Shannon" = shannon,
        "Simpson" = simpson,
        "Inverse_Simpson" = inverse_simpson
    ))
}

# Main script
args <- commandArgs(trailingOnly = TRUE)
if (length(args) < 2) {
    stop("Please provide both the input data file and the output data file as command-line arguments.")
}

input_file <- args[1]
output_file <- args[2]

if (!file.exists(input_file)) {
    stop(paste("The file", input_file, "does not exist."))
}

data <- read.table(input_file, header = TRUE, row.names = 1)

diversity_results <- apply(data, 2, calculate_alpha_diversity)

# Convert the results into a data frame
diversity_results_df <- do.call(rbind, lapply(diversity_results, as.data.frame))
rownames(diversity_results_df) <- colnames(data)

# Write the results to the output file
write.table(diversity_results_df, file = output_file, sep = "\t", col.names = NA, quote = FALSE)

# Print a success message
cat("Diversity results saved to", output_file, "\n")
