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

**Requirements:** R, RStudio, Quarto, and the R packages `dplyr`, `ggplot2` and `knitr`.

1. Download or clone this repository.
2. Open the RStudio project file.
3. Ensure the original UCI dataset is available in `data/raw/`, or run `import_data_1.R` to download it.
4. Open `cardiovascular_report.qmd`.
5. Render the document using Quarto to regenerate the statistical tables and figures.

PDF rendering additionally requires a LaTeX installation such as TinyTeX.

## Limitations

This is an exploratory observational study based on a small, historical and clinically selected dataset. The statistical models have not been externally validated and are not intended for clinical decision-making.

## Report

The full methods, results, figures, discussion and references are available in `cardiovascular_report.pdf`.

## Data Attribution

Janosi, A., Steinbrunn, W., Pfisterer, M., & Detrano, R. (1988). *Heart Disease*. UCI Machine Learning Repository. https://doi.org/10.24432/C52P4X