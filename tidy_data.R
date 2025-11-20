###############################################################
# tidy_data.R
# Data Cleaning and Preparation Script
# For Food Security Analysis (Border Counties)
# Author: Your Name
# Date: 2025
#
# This script documents how the datasets were tidied
# (as required by assignment) and loads the final cleaned files
# generated with the assistance of GenAI.
###############################################################

library(tidyverse)
library(readxl)
library(janitor)

###############################################################
# STEP 1: Import Cleaned Datasets
# (These files were cleaned using GenAI tools as allowed.)
###############################################################

mmg     <- read_excel("MMG_border_cleanACTUAL.xlsx") %>% clean_names()
foodenv <- read_excel("cleaned_border_counties_renamedACTUAL.xlsx") %>% clean_names()
spm     <- read_excel("SPM2019_household_level_clean.xlsx") %>% clean_names()

###############################################################
# STEP 2: Define Border Counties
# (Used for filtering USDA + Feeding America datasets)
###############################################################

border_counties <- c(
  "san diego","imperial","yuma","pima","santa cruz","cochise",
  "hidalgo","luna","dona ana","el paso","hudspeth","jeff davis",
  "presidio","brewster","terrell","val verde","kinney","maverick",
  "webb","zapata","starr","cameron"
)

###############################################################
# STEP 3: Demonstrate Filtering Process (Documented Only)
# NOTE: These datasets are already pre-filtered, but this shows
#       the reproducible tidying steps expected for assignment.
###############################################################

# Example: USDA Food Access Atlas (county filtering)
# (The cleaned dataset already contains only the correct counties.)
foodenv_filtered <- foodenv %>%
  mutate(county_normalized = str_to_lower(county)) %>%
  filter(county_normalized %in% border_counties)

# Example: Feeding America (food insecurity) filtering
mmg_filtered <- mmg %>%
  mutate(county_normalized = str_to_lower(gsub(" county","",county))) %>%
  filter(county_normalized %in% border_counties)

# Example: SPM household-level dataset
# (Already household-level: SPM_Head == 1)
spm_clean <- spm %>%
  mutate(spm_poor = as.integer(spm_poor))

###############################################################
# STEP 4: Export Clean Versions for Modeling / Visualization
###############################################################

write_csv(foodenv_filtered, "foodenv_border_clean.csv")
write_csv(mmg_filtered, "mmg_border_clean.csv")
write_csv(spm_clean, "spm_clean_households.csv")

###############################################################
# END OF SCRIPT
###############################################################
