## Movement physiology – repeated-measures ANOVA on jump height

# install.packages("ez")      # run once
# install.packages("ggplot2") # run once

library(ez)
library(ggplot2)

## 1. Load data ---------------------------------------------------------
# better than setwd() for GitHub/shared code
data <- read.csv("jumpheightANOVA.csv")

# make sure factors are set
data$ID   <- as.factor(data$ID)
data$Type <- factor(data$Type, levels = c("S", "CMJ", "CMJA"))  # ordered

## 2. Repeated-measures ANOVA ------------------------------------------
res <- ezANOVA(
  data   = data,
  dv     = .(Height),
  wid    = .(ID),
  within = .(Type),
  type   = 3,
  detailed = TRUE
)
print(res)

# note for your write-up:
# if Mauchly’s test (in res$`Mauchly's Test for Sphericity`) is p < 0.05,
# report the sphericity-corrected (Greenhouse-Geisser) results.

## 3. Base R boxplot ----------------------------------------------------
boxplot(
  Height ~ Type,
  data = data,
  ylab = "Height (cm)",
  xlab = "Type of jump",
  col  = c("green", "yellow", "red"),
  frame.plot = FALSE
)

## 4. ggplot version ----------------------------------------------------
ggplot(data, aes(x = Type, y = Height, fill = Type)) +
  geom_boxplot() +
  scale_fill_manual(values = c("green", "orange", "red")) +
  labs(x = "Type of jump", y = "Height (cm)") +
  theme_classic() +
  theme(legend.position = "none")
