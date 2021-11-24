#### ---- Data ----
library(data.table)
library(openxlsx)

## Title: Contraceptive Method Choice

## Description
# This dataset is a subset of the 1987 National Indonesia Contraceptive
# Prevalence Survey. The samples are married women who were either not 
# pregnant or do not know if they were at the time of interview. The 
# problem is to predict the current contraceptive method choice 
# (no use, long-term methods, or short-term methods) of a woman based 
# on her demographic and socio-economic characteristics.


#### ---- Downloading the data ----

## Download the datasets and the labels
df_url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/cmc/cmc.data"
desc_url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/cmc/cmc.names"

setwd("./docs/data/")
# Check if the dataset already exist
pattern <- "contraceptive" # How is the dataset named in the computer?
if(length(list.files("."))>0 & sum(grepl(pattern, list.files("."), ignore.case = T))==1){
    df_name <- grep(pattern, list.files(), value = T)
    print("Reading dataset from your computer... \n")
    working_df <- read.xlsx(df_name, sheet = 2)
    cat(df_name, " dataset already saved!!! We'll proceed to modeling.", "\n")
} else {
  # Download data
  cat("Dowloading dataset from ", df_url, "\n")
  contraceptive_df <- fread(df_url, showProgress = FALSE)
  # Get variable information
  desc_file <- readLines(desc_url, warn = FALSE)
  var_info_pos <- grep(". Attribute information", desc_file, ignore.case = T) + 2
  var_info <- desc_file[var_info_pos:(var_info_pos+ncol(contraceptive_df) + 1)]
  var_info_names <- sub("\\(.*", "", var_info)[1:10]
  var_info_names <- sub("^\\s+", "", var_info_names)
  var_info_names <- sub("*\\s+$", "", var_info_names)
  var_info_names <- sub("*[0-9].|10.", "", var_info_names)
  var_info_names <- sub("^\\s+", "", var_info_names)
  
  var_info_type <- sub("\\).*", "", var_info)
  var_info_type <- sub(".*\\(", "", var_info_type)[1:10]
  var_info_type[4] <- "categorical"
  
  var_info_values <- sub(".*\\)", "", var_info)
  var_info_values <- sub("^\\s+", "", var_info_values)
  var_info_values[4] <- paste("0", "1-2", "3-4", "5+", sep = ", ")
  
  vars <- c("wife_age"
    , "wife_edu"
    , "hus_edu"
    , "num_child"
    , "wife_rel"
    , "wife_work"
    , "hus_occup"
    , "live_index"
    , "media_exp"
    , "con_method"
  )
  
  desc_df <- data.frame(Variable = vars
    , Description = var_info_names
    , Type = var_info_type
    , Values = c(var_info_values[1:9]
      , paste(var_info_values[10]
      , var_info_values[11]
      , var_info_values[12]
      , sep = ", "
      )
    )
  )
  
  colnames(contraceptive_df) <- vars
  
  #Add variable names to the data set and save the data set in .xlsx together the variable discription
  contraceptive_df_info <- list(Description = desc_df, Data = contraceptive_df)
  write.xlsx(contraceptive_df_info, "contraceptive_data.xlsx", overwrite=TRUE) # Uncomment to save the dataset
  write.csv(contraceptive_df, file="contraceptive_data.csv")
  write.csv(desc_df, file="contraceptive_description.csv")
}
