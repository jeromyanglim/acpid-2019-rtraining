# Things to usually do before putting data file 
# * Create variable names that work well with R 
#   (e.g., lower case, no spaces, descriptive, consistent style, not too long)
#
# Things to put in a data preparation file
# * Create variable sets
# * Create derived datasets
#      - Datasets with certain cases removed
#      - Restructure from wide to long or long to wide
#      - Merge multiple datasets
# * Handle missing data
# * Create derived variables
#      - imputed missing data
#      - Scale scores
#      - Other composite variables
#      - Recoded categorical variables
#      - Processed dates
#


# It is often useful to create sets of variable names
# By convention, the list that stores these variable sets is called 'v'
v <- list()
v$mlq_items <- meta.mlq$id  
v$mlq_scales <- unique(meta.mlq$scale)
v$mlq_transactional <- c("mbep", "mbea", "cr")
v$mlq_transformational <- c("ac", "is", "ic")
v$outcome <- "goal"


# we could exclude missing data
mlq$missing_count <- apply(mlq[,c(v$mlq_scales, v$outcome)], 1, function(X) sum(is.na(X)))

mlq <- mlq[mlq$missing_count == 0, ]
