Module 3 - Data Frame Assignment
By: Steven Barden
Due: Monday, 8 AM

Election Poll Analysis
For this assignment, I analyzed a fictional dataset representing poll results from the 2016 presidential election using R. The dataset includes poll numbers from two sources: ABC and CBS. After correcting minor syntax issues in the given dataset, I created a structured data frame to store and process the information.

The candidates in the dataset are:

Jeb, Donald, Ted, Marco, Carly, Hillary, and Bernie
The poll results are as follows:

Candidate	ABC Poll	CBS Poll
Jeb	4	12
Donald	62	75
Ted	51	43
Marco	21	19
Carly	2	1
Hillary	14	21
Bernie	15	19
Analysis and Observations
Donald Trump leads in both ABC (62%) and CBS (75%) polls.
Ted Cruz follows with 51% (ABC) and 43% (CBS).
Hillary Clinton and Bernie Sanders show similar numbers, but Hillary is slightly ahead in CBS polls.
Carly Fiorina has the lowest polling numbers, with only 2% (ABC) and 1% (CBS).
Polling discrepancies exist, with some candidates performing better in CBS vs. ABC and vice versa.
Code Implementation
The R script I developed for this assignment ensures data integrity, performs summary statistics, and generates visualizations. The implementation includes:

Data validation to check for errors in input.
Summary statistics to provide insights into the dataset.
A bar chart visualization to compare ABC and CBS poll numbers.
Visualization
A bar chart was generated to visualize the poll results, showing how candidates performed in ABC vs. CBS polling sources.

![Placeholder for Figure 1]

GitHub Repository
The full R script is available in my GitHub repository:
🔗 [GitHub Link Placeholder]

Conclusion
This dataset provides a fictional yet structured look at polling numbers in a 2016-style election scenario. While polling numbers suggest Donald Trump had a strong lead, the discrepancies between different polling agencies highlight how results can vary based on methodology and sample selection. Understanding how polls are structured and analyzed is crucial for making data-driven interpretations in political science and statistics.

> source("D:/College/USF-Spring-2025/4370/Module03/Code/Module03.R", echo=TRUE)

> # =====================================================================================
> # Title:        Module 3 - Data Frame Assignment
> # Filen .... [TRUNCATED] 

> # Function to check and install missing libraries
> check_libraries <- function() {
+   missing_libraries <- required_libraries[!(required_libraries .... [TRUNCATED] 

> check_libraries() # Ensure all required libraries are installed

> # Load required libraries
> library(ggplot2)

> library(dplyr)

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union


> library(tibble)

> library(methods)

> # -------------------------
> # Class Definition: PollData
> # -------------------------
> # A class to encapsulate election poll data, validation,  .... [TRUNCATED] 

> # -------------------------
> # Main Execution
> # -------------------------
> tryCatch({
+   cat("Starting election poll analysis...\n")
+ 
+   # C .... [TRUNCATED] 
Starting election poll analysis...
Initializing PollData object...
Validating dataset...
Data validation passed.
Displaying summary statistics:
  Candidate            ABC_Poll        CBS_Poll    
 Length:7           Min.   : 2.00   Min.   : 1.00  
 Class :character   1st Qu.: 9.00   1st Qu.:15.50  
 Mode  :character   Median :15.00   Median :19.00  
                    Mean   :24.14   Mean   :27.14  
                    3rd Qu.:36.00   3rd Qu.:32.00  
                    Max.   :62.00   Max.   :75.00  
Generating poll results visualization...
Script execution completed successfully.
> 
