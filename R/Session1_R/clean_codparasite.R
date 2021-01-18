# Clean CodParasite data
# M. Johnston
# Sun Jan 17 11:15:10 2021 ------------------------------



source("R/utils_training.R")

cod = read.csv("data/CodParasite.csv", stringsAsFactors = FALSE)

# Subset down to just the columns we will be using later:

cod = cod[ , c("Sample", "Year", "Intensity", "Weight", "Length", "Age")]

## use the logical indexing and the is.na function to subset cod down to only the rows that don't contain NAs in the Weight and Length columns, and where Age != 0

cod = cod[!is.na(cod$Weight) & !is.na(cod$Length) & cod$Age != 0, ]

# use the condition function (already in your workspace because we sourced it from utils) to create a new column:

cod$K = condition(cod$Weight, cod$Length)

saveRDS(cod, "output/codparasite_clean.rds")


# At the end, make sure the students type something like this at the top of this script:
# The goal of this script is to load and clean the cod parasite data.  The output of this script is output/codparasite_clean.rds