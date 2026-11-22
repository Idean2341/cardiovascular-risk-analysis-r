source("clean_data_2.R")

library(ggplot2)

age_plot <- ggplot(
  heart_clean,
  aes(x = cad_group, y = age)
) +
  geom_boxplot(
    fill = "#A9C9E2",
    colour = "#264653",
    width = 0.5
  ) +
  labs(
    title = "Age Distribution by Coronary Artery Disease Status",
    x = "Coronary Artery Disease Status",
    y = "Age (years)",
    caption = "Source: UCI Cleveland Heart Disease Dataset"
  ) +
  theme_minimal(base_size = 13)

print(age_plot)

dir.create("figures", showWarnings = FALSE)

ggsave(
  filename = "figures/age_by_cad.png",
  plot = age_plot,
  width = 8,
  height = 5,
  dpi = 300
)

file.exists("figures/age_by_cad.png")

chol_plot <- ggplot(
  heart_clean,
  aes(x = cad_group, y = chol)
) +
  geom_boxplot(
    fill = "#B7D9C5",
    colour = "#285943",
    width = 0.5
  ) +
  labs(
    title = "Total Cholesterol by Coronary Artery Disease Status",
    x = "Coronary Artery Disease Status",
    y = "Total Cholesterol (mg/dL)",
    caption = "Source: UCI Cleveland Heart Disease Dataset"
  ) +
  theme_minimal(base_size = 13)

print(chol_plot)

ggsave(
  filename = "figures/cholesterol_by_cad.png",
  plot = chol_plot,
  width = 8,
  height = 5,
  dpi = 300
)
