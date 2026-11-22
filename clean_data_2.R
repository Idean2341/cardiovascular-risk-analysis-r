source("import_data_1.R")

library(dplyr)

heart_clean <- heart |>
  mutate(
    cad_present = if_else(num == 0, 0L, 1L),
    
    cad_group = factor(
      cad_present,
      levels = c(0, 1),
      labels = c("No CAD", "CAD present")
    ),
    
    sex_group = factor(
      sex,
      levels = c(0, 1),
      labels = c("Female", "Male")
    )
  )

print(heart_clean |>
        count(cad_group))


heart_clean |>
  count(cad_group)


heart_clean |>
  group_by(cad_group) |>
  summarise(
    patient_count = n(),
    mean_age = mean(age, na.rm = TRUE)
  )


heart_clean |>
  group_by(cad_group) |>
  summarise(
    patient_count = n(),
    mean_age = mean(age, na.rm = TRUE),
    mean_cholesterol = mean(chol, na.rm = TRUE),
    mean_systolic_bp = mean(trestbps, na.rm = TRUE)
  )

range(heart_clean$chol, na.rm = TRUE)

heart_clean |>
  filter(chol > 400) |>
  select(age, sex_group, chol, cad_group)

heart_clean |>
  group_by(cad_group) |>
  summarise(
    patients = n(),
    mean_chol = mean(chol, na.rm = TRUE),
    median_chol = median(chol, na.rm = TRUE),
    sd_chol = sd(chol, na.rm = TRUE),
    min_chol = min(chol, na.rm = TRUE),
    max_chol = max(chol, na.rm = TRUE)
  )
