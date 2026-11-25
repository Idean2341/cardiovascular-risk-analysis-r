# Exploring Cardiovascular Disease Risk Factors Using R

**An independent exploratory analysis of the UCI Cleveland Heart Disease dataset.**

## Project Overview

This project investigates associations between age, sex, resting systolic blood pressure, total cholesterol and the presence of coronary artery disease (CAD).

The analysis uses R to demonstrate data preparation, exploratory data analysis, statistical modelling, visualisation and reproducible scientific reporting.

## Dataset

- **Source:** UCI Machine Learning Repository — Heart Disease
- **Sample:** 303 patient records
- **Outcome:** Presence or absence of angiographically defined CAD
- **Licence:** Creative Commons Attribution 4.0
- **Dataset DOI:** https://doi.org/10.24432/C52P4X

## Methods

The project includes:

- Data import, cleaning and missing-value assessment
- Descriptive statistics and visualisation using `dplyr` and `ggplot2`
- Welch's independent-samples t-tests
- Multivariable logistic regression
- Exploratory natural cubic spline modelling
- Sensitivity analysis and Cook's distance influence screening
- Reproducible research reporting using Quarto

## Key Findings

Among the 303 patients, 139 (45.9%) had recorded CAD.

In the initial multivariable logistic regression, age and male sex were associated with higher odds of CAD. Resting systolic blood pressure and total cholesterol did not demonstrate statistically significant adjusted associations at the conventional 5% threshold.

Exploratory analysis suggested a nonlinear association with age, although estimates at the extremes of the age distribution were uncertain.

These results describe associations within a selected historical clinical sample and should not be interpreted as causal effects or estimates of future cardiovascular risk.

## Reproducing the Analysis

This project uses R and Quarto for statistical analysis and reporting. R package dependencies are managed using `renv`, with package versions recorded in `renv.lock`.

### Requirements

- R (developed using version 4.6.2)
- Quarto
- RStudio (recommended)
- TinyTeX or another LaTeX installation for PDF rendering

### Instructions

1. Clone or download this repository.
2. Open `cardiovascular-risk-analysis.Rproj` in RStudio.
3. Install `renv` if necessary:

   `install.packages("renv")`

4. Restore the recorded package dependencies:

   `renv::restore()`

5. Render the report from the project directory.

   **HTML:**
   `quarto render cardiovascular_report.qmd --to html`

   **PDF:**
   `quarto render cardiovascular_report.qmd --to pdf`

### Project Files

The original Cleveland dataset is included in `data/raw/`.

The individual R scripts can be run from the project directory and load their required data preparation scripts automatically.

The Quarto source file (`cardiovascular_report.qmd`) generates the statistical tables and figures presented in the research report.

## Limitations

This is an exploratory observational study based on a small, historical and clinically selected dataset. The statistical models have not been externally validated and are not intended for clinical decision-making.

## Report

The full methods, results, figures, discussion and references are available in `cardiovascular_report.pdf`.

## Data Attribution

Janosi, A., Steinbrunn, W., Pfisterer, M., & Detrano, R. (1988). *Heart Disease*. UCI Machine Learning Repository. https://doi.org/10.24432/C52P4X