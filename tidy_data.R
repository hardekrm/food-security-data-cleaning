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

###############################################################################
# tidy_data.R
# Author: Ryan Hardek and Vivian Dao
# Course: ISA Data Visualization – Border Food Insecurity Project
#
# Purpose:
#   This script loads the 3 cleaned datasets used for the analysis:
#     1. USDA Food Access Atlas (border counties only)
#     2. Feeding America – Map the Meal Gap (border counties only)
#     3. 2019 Supplemental Poverty Measure (SPM) – Aggregated to household level
#
#   These datasets were cleaned *beforehand* using generative AI assistance
#   (ChatGPT). The cleaning steps were performed outside of R to:
#     - Filter only the U.S.–Mexico border counties
#     - Standardize variable names
#     - Remove irrelevant variables
#     - Produce tidy, analysis-ready Excel sheets
#
#   Because of this, the R script does NOT perform additional data cleaning.
#   It simply:
#       (1) reads the cleaned datasets,
#       (2) verifies they loaded correctly,
#       (3) prepares them for analysis inside DeepNote or RStudio.
#
###############################################################################

# ------------------------------- #
# Load Required Libraries
# ------------------------------- #

library(readxl)     # Reading Excel files
library(janitor)    # clean_names() for consistent variable naming
library(dplyr)      # general data handling (optional but helpful)

# ------------------------------- #
# Load Cleaned Datasets
# ------------------------------- #
# NOTE:
# These files were cleaned using Python + AI tools prior to R.
# No additional cleaning is performed here.

border_food_access <- read_excel("2025FoodAtlasCleaned.xlsx") |>
  clean_names()

border_meal_gap <- read_excel("MMGCleaned.xlsx") |>
  clean_names()

spm_households <- read_excel("SPM2019_Cleaned.xlsx") |>
  clean_names()

# ------------------------------- #
# Inspect the Data Structures
# ------------------------------- #

cat("\n----- Border Food Access Data -----\n")
str(border_food_access)

cat("\n----- Feeding America Meal Gap Data -----\n")
str(border_meal_gap)

cat("\n----- Supplemental Poverty Measure Household Data -----\n")
str(spm_households)

# ------------------------------- #
# Completion Message
# ------------------------------- #

cat("\n\n✓ tidy_data.R executed successfully.\n")
cat("✓ All datasets were loaded correctly and are ready for analysis.\n")
cat("✓ Datasets were pre-cleaned using AI (ChatGPT) as documented.\n")
###############################################################################
