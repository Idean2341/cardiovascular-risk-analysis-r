source("logistic_regression_5.R")

library(ggplot2)

prediction_data <- expand.grid(
  age = seq(40, 69, length.out = 100),
  sex_group = levels(heart_clean$sex_group)
)

prediction_data$sex_group <- factor(
  prediction_data$sex_group,
  levels = levels(heart_clean$sex_group)
)

prediction_data$trestbps <- median(
  heart_clean$trestbps,
  na.rm = TRUE
)

prediction_data$chol <- median(
  heart_clean$chol,
  na.rm = TRUE
)

pred <- predict(
  age_spline_model,
  newdata = prediction_data,
  type = "link",
  se.fit = TRUE
)

prediction_data$probability <- plogis(pred$fit)

prediction_data$lower <- plogis(
  pred$fit - 1.96 * pred$se.fit
)

prediction_data$upper <- plogis(
  pred$fit + 1.96 * pred$se.fit
)

age_model_plot <- ggplot(
  prediction_data,
  aes(
    x = age,
    y = probability,
    colour = sex_group,
    fill = sex_group
  )
) +
  geom_ribbon(
    aes(ymin = lower, ymax = upper),
    alpha = 0.15,
    colour = NA
  ) +
  geom_line(linewidth = 1.1) +
  labs(
    title = "Adjusted Association Between Age and CAD",
    subtitle = "Natural spline logistic regression",
    x = "Age (years)",
    y = "Model-estimated probability of CAD",
    colour = "Sex",
    fill = "Sex",
    caption = "UCI Cleveland dataset | Shading: approximate 95% CI"
  ) +
  scale_y_continuous(
    labels = function(x) paste0(round(x * 100), "%")
  ) +
  theme_minimal(base_size = 13)

print(age_model_plot)

dir.create("figures", showWarnings = FALSE)

ggsave(
  "figures/age_adjusted_cad_probability.png",
  plot = age_model_plot,
  width = 9,
  height = 6,
  dpi = 300
)
