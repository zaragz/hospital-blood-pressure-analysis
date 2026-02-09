# Frequency of hospital visits (last 12 months)
Freq <- c(0.6, 0.3, 0.4, 0.4, 0.2, 0.6, 0.3, 0.4, 0.9, 0.2)
# Blood pressure values
bloodp <- c(103, 87, 32, 42, 59, 109, 78, 205, 135, 176)

# First doctor assessment (bad/good, one NA)
first_txt  <- c("bad","bad","bad","bad","good","good","good","good", NA, "bad")
# Second doctor assessment (low/high)
second_txt <- c("low","low","high","high","low","low","high","high","high","high")
# Final decision (low/high)
final_txt  <- c("low","high","low","high","low","high","low","high","high","high")

# First doctor: bad = 1, good = 0, NA stays NA
first <- ifelse(is.na(first_txt), NA, ifelse(first_txt == "bad", 1, 0))
# Second doctor: high = 1, low = 0
second <- ifelse(second_txt == "high", 1, 0)
# Final decision: high = 1, low = 0
finaldecision <- ifelse(final_txt == "high", 1, 0)

# Create a data frame for easier analysis
patients <- data.frame(Freq, bloodp, first, second, finaldecision)
# View the dataset
patients

# A1) Single boxplot (literal boxplot(x,...))
# Basic boxplot using one vector
boxplot(patients$bloodp, main="Boxplot of Blood Pressure", ylab="Blood pressure")

# A2) Side-by-side boxplots (by ratings/decision)
# Display three plots in one row
par(mfrow = c(1,3))
# BP vs First doctor rating
boxplot(bloodp ~ first, data = patients, names = c("good (0)", "bad (1)"),
        main = "BP vs First", xlab = "First", ylab = "BP", na.action = na.omit)
# BP vs Second doctor assessment
boxplot(bloodp ~ second, data = patients, names = c("low (0)", "high (1)"),
        main = "BP vs Second", xlab = "Second", ylab = "BP")
# BP vs Final decision
boxplot(bloodp ~ finaldecision, data = patients, names = c("low (0)", "high (1)"),
        main = "BP vs Final", xlab = "Final", ylab = "BP")
# Reset plot layout to normal
par(mfrow = c(1,1))

# A3) Histogram
# Create histogram of BP values
hist(patients$bloodp, main="Histogram of Blood Pressure", xlab="Blood pressure")


# Overall summary of BP
summary(patients$bloodp)

# BP grouped by second doctor
tapply(patients$bloodp, patients$second, summary)

# BP grouped by final decision
tapply(patients$bloodp, patients$finaldecision, summary)

# BP grouped by first doctor (removes NA automatically)
tapply(patients$bloodp, patients$first, summary)

dev.off()

# Reset layout
par(mfrow = c(1,1))


# Save histogram
png("hist_bp.png", width = 800, height = 600)

hist(patients$bloodp,
     main = "Histogram of Blood Pressure",
     xlab = "Blood Pressure")

dev.off()

