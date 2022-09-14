# C. Savonen 
# 2022

# Set up the dataset for the countries_project.Rmd

library(magrittr)

# Find .git root directory
root_dir <- rprojroot::find_root(rprojroot::has_dir(".git"))


# Neaten up countries df
countries_df <- read_csv(file.path(root_dir, "03_Cleaning_the_Data", "data", "raw", "countries_of_the_world.csv"), 
                     show_col_types = FALSE)
  
countries_df <- countries_df %>% 
  rename_all(~str_remove_all(., "\\(|\\)|\\.|\\$")) %>% 
  rename_all(~str_replace_all(., " ", "_")) %>% 
  rename_all(~str_replace_all(., "\\/", "_to_")) %>% 
  rename(GDP = GDP__per_capita)

write_csv(countries_df, file.path(root_dir, "03_Cleaning_the_Data", "data", "countries_of_the_world.csv"))
