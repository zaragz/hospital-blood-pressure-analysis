# Hospital Blood Pressure Analysis

This project analyzes hospital patient data using R. The dataset contains
information on visit frequency, blood pressure, doctor assessments, and final treatment decisions for 10 patients.

## Files

- hospital_bp.R  
  Main R script used to enter the data, create plots, and calculate summaries.

- boxplots.png  
  Side-by-side boxplots comparing blood pressure with doctor ratings.

- hist_bp.png  
  Histogram showing the distribution of blood pressure values.

## Methods

The analysis includes:

- Data entry and recoding of categorical variables
- Creation of boxplots and histograms
- Summary statistics using `summary()` and `tapply()`

## Results

The results show that patients with higher blood pressure are more likely to
receive higher second-doctor ratings and high final decisions. The dataset
includes one extreme outlier (BP = 205), which affects the overall distribution.

## How to Run

1. Open hospital_bp.R in RStudio
2. Run the script
3. View plots in the Plots panel or generated PNG files

## Author

Zara Gonzalez
