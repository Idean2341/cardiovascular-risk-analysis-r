source("clean_data_2.R")

chol_test <- t.test(
  chol ~ cad_group,
  data = heart_clean,
  var.equal = FALSE
)

print(chol_test)

bp_test <- t.test(
  trestbps ~ cad_group,
  data = heart_clean,
  var.equal = FALSE
)

print(bp_test)

heart_clean |>
  group_by(cad_group) |>
  summarise(
    patients = n(),
    mean_bp = mean(trestbps, na.rm = TRUE),
    sd_bp = sd(trestbps, na.rm = TRUE),
    median_bp = median(trestbps, na.rm = TRUE)
  )
