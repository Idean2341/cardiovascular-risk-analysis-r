dir.create("data/raw",
           recursive = TRUE,
           showWarnings = FALSE)

data_url <- paste0(
  "https://archive.ics.uci.edu/ml/",
  "machine-learning-databases/",
  "heart-disease/processed.cleveland.data"
)

raw_file <- "data/raw/processed.cleveland.data"

if (!file.exists(raw_file)) {
  download.file(data_url,
                destfile = raw_file,
                mode = "wb")
}

heart <- read.csv(
  raw_file,
  header = FALSE,
  na.strings = "?"
)

stopifnot(ncol(heart) == 14)

names(heart) <- c(
  "age", "sex", "cp", "trestbps",
  "chol", "fbs", "restecg", "thalach",
  "exang", "oldpeak", "slope", "ca",
  "thal", "num"
)

stopifnot(nrow(heart) == 303)

print(dim(heart))
print(head(heart))
str(heart)

print(colSums(is.na(heart)))

print(table(heart$num, useNA = "ifany"))

mean (heart$age)

colSums(is.na(heart))
