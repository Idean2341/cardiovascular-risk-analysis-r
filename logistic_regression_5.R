cad_model <- glm(
  cad_present ~ I(age / 10) +
    sex_group +
    I(trestbps / 10) +
    I(chol / 10),
  data = heart_clean,
  family = binomial(link = "logit")
)

summary(cad_model)

odds_ratios <- exp(
  cbind(
    OR = coef(cad_model),
    confint.default(cad_model)
  )
)

round(odds_ratios, 2)

summary(cad_model)

round(odds_ratios, 2)

model_results <- data.frame(
  Variable = names(coef(cad_model)),
  
  Odds_Ratio = exp(coef(cad_model)),
  
  CI_Lower = exp(
    confint.default(cad_model)[, 1]
  ),
  
  CI_Upper = exp(
    confint.default(cad_model)[, 2]
  ),
  
  P_Value = summary(cad_model)$coefficients[, 4]
)

print(
  model_results,
  digits = 4,
  row.names = FALSE
)

max_chol <- max(heart_clean$chol, na.rm = TRUE)

heart_clean |>
  filter(chol == max_chol) |>
  select(age, sex_group, chol, cad_group)

heart_sensitivity <- heart_clean |>
  filter(chol != max_chol)

cad_model_sensitivity <- glm(
  cad_present ~ I(age / 10) +
    sex_group +
    I(trestbps / 10) +
    I(chol / 10),
  data = heart_sensitivity,
  family = binomial(link = "logit")
)

comparison <- data.frame(
  Variable = names(coef(cad_model)),
  Original_OR = round(exp(coef(cad_model)), 3),
  Sensitivity_OR = round(
    exp(coef(cad_model_sensitivity)), 3
  )
)

print(comparison)

cooks_d <- cooks.distance(cad_model)

influence_data <- heart_clean |>
  mutate(
    patient_row = row_number(),
    cooks_distance = cooks_d
  )

influence_data |>
  arrange(desc(cooks_distance)) |>
  select(
    patient_row,
    age,
    sex_group,
    trestbps,
    chol,
    cad_group,
    cooks_distance
  ) |>
  slice_head(n = 5)

threshold <- 4 / nobs(cad_model)

sum(cooks_d > threshold)

age_spline_model <- glm(
  cad_present ~
    splines::ns(age, df = 3) +
    sex_group +
    I(trestbps / 10) +
    I(chol / 10),
  data = heart_clean,
  family = binomial(link = "logit")
)

anova(
  cad_model,
  age_spline_model,
  test = "Chisq"
)

AIC(cad_model, age_spline_model)

bp_spline_model <- glm(
  cad_present ~
    splines::ns(age, df = 3) +
    sex_group +
    splines::ns(trestbps, df = 3) +
    I(chol / 10),
  data = heart_clean,
  family = binomial(link = "logit")
)

anova(
  age_spline_model,
  bp_spline_model,
  test = "Chisq"
)

AIC(age_spline_model, bp_spline_model)

chol_spline_model <- glm(
  cad_present ~
    splines::ns(age, df = 3) +
    sex_group +
    I(trestbps / 10) +
    splines::ns(chol, df = 3),
  data = heart_clean,
  family = binomial(link = "logit")
)

anova(
  age_spline_model,
  chol_spline_model,
  test = "Chisq"
)

AIC(age_spline_model, chol_spline_model)

age_analysis <- heart_clean |>
  mutate(
    age_band = cut(
      age,
      breaks = seq(20, 90, by = 10),
      right = FALSE
    )
  ) |>
  group_by(age_band, sex_group) |>
  summarise(
    patients = n(),
    cad_cases = sum(cad_present),
    cad_percentage = round(
      mean(cad_present) * 100, 1
    ),
    .groups = "drop"
  )

print(age_analysis, n = Inf)

sum(duplicated(heart))

heart_clean |>
  summarise(
    patients = n(),
    
    missing_primary = sum(!complete.cases(
      age, sex_group, trestbps,
      chol, cad_present
    )),
    
    invalid_age = sum(
      age < 18 | age > 110,
      na.rm = TRUE
    ),
    
    invalid_bp = sum(
      trestbps <= 0,
      na.rm = TRUE
    ),
    
    invalid_chol = sum(
      chol <= 0,
      na.rm = TRUE
    ),
    
    invalid_outcome = sum(
      !(num %in% 0:4),
      na.rm = TRUE
    )
  )

range(heart_clean$age, na.rm = TRUE)
range(heart_clean$trestbps, na.rm = TRUE)
range(heart_clean$chol, na.rm = TRUE)

