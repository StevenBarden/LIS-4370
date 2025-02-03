# =====================================================================================
# Title:        Module 3 - Data Frame Assignment
# Filename:     module.R
# Author:       Steven Barden
# Created:      2025-02-02
# Updated:      2025-02-02
# Version:      1.0.0
# Description:  Analyzing a fictional 2016 election poll dataset using data frames.
#               This script reads and processes a dataset, validates data integrity,
#               performs statistical analysis, and generates visualizations.
# Dependencies: Requires ggplot2, dplyr, tibble, and methods.
# License:      MIT
# Contact:      StevenBarden@USF.edi
# =====================================================================================

# -------------------------
# Library and Dependency Management
# -------------------------
required_libraries <- c("ggplot2", "dplyr", "tibble", "methods")

# Function to check and install missing libraries
check_libraries <- function() {
  missing_libraries <- required_libraries[!(required_libraries %in% installed.packages()[,"Package"])]

  if (length(missing_libraries) > 0) {
    cat("Missing libraries detected. Please run this script as an administrator and install them manually.\n")
    cat("Run the following command:\n")
    cat(sprintf("install.packages(c('%s'))\n", paste(missing_libraries, collapse="', '")))
    stop("Exiting due to missing dependencies.")
  }
}

check_libraries() # Ensure all required libraries are installed

# Load required libraries
library(ggplot2)
library(dplyr)
library(tibble)
library(methods)

# -------------------------
# Class Definition: PollData
# -------------------------
# A class to encapsulate election poll data, validation, and operations
PollData <- setRefClass(
  "PollData",
  fields = list(
    candidates = "character",
    abc_poll = "numeric",
    cbs_poll = "numeric",
    poll_df = "data.frame"
  ),
  methods = list(
    initialize = function() {
      cat("Initializing PollData object...\n")
      # Default dataset (corrected)
      candidates <<- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")
      abc_poll <<- c(4, 62, 51, 21, 2, 14, 15)
      cbs_poll <<- c(12, 75, 43, 19, 1, 21, 19)

      # Create DataFrame
      poll_df <<- data.frame(
        Candidate = candidates,
        ABC_Poll = abc_poll,
        CBS_Poll = cbs_poll
      )

      validate_data() # Run validation checks
    },

    validate_data = function() {
      cat("Validating dataset...\n")
      if (length(candidates) != length(abc_poll) || length(candidates) != length(cbs_poll)) {
        stop("Error: Mismatched dataset lengths!")
      }
      if (any(is.na(abc_poll)) || any(is.na(cbs_poll))) {
        stop("Error: Missing values in dataset!")
      }
      if (any(abc_poll < 0) || any(cbs_poll < 0)) {
        stop("Error: Poll results cannot be negative!")
      }
      cat("Data validation passed.\n")
    },

    display_summary = function() {
      cat("Displaying summary statistics:\n")
      print(summary(poll_df))
    },

    visualize_poll_results = function() {
      cat("Generating poll results visualization...\n")
      poll_melted <- poll_df %>%
        tidyr::pivot_longer(cols = c("ABC_Poll", "CBS_Poll"), names_to = "Source", values_to = "Votes")

      ggplot(poll_melted, aes(x = Candidate, y = Votes, fill = Source)) +
        geom_bar(stat = "identity", position = "dodge") +
        theme_minimal() +
        labs(title = "2016 Fictional Election Poll Results", x = "Candidate", y = "Poll Percentage")
    }
  )
)

# -------------------------
# Main Execution
# -------------------------
tryCatch({
  cat("Starting election poll analysis...\n")

  # Create an instance of PollData
  poll_analysis <- PollData$new()

  # Display summary statistics
  poll_analysis$display_summary()

  # Generate visualization
  poll_analysis$visualize_poll_results()

  cat("Script execution completed successfully.\n")

}, error = function(e) {
  cat("An error occurred:", conditionMessage(e), "\n")
})
