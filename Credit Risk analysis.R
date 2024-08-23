# Install necessary packages if not already installed
install.packages("dplyr")
install.packages("caret")
install.packages("magrittr")

# Load necessary libraries
library(dplyr)
library(caret)
library(magrittr)

# Load the dataset
credit_data <- read.csv("/Users/madanshiva/Desktop/Credit Risk Analysis/CREDIT application_record.csv")

# Display the structure of the dataset
str(credit_data)

# Display summary statistics of the dataset
summary(credit_data)

# Check for missing values
missing_values <- sapply(credit_data, function(x) sum(is.na(x)))
print(missing_values)

# Handle missing values by filling with 'Unknown' for 'OCCUPATION TYPE'
credit_data$OCCUPATION.TYPE[is.na(credit_data$OCCUPATION.TYPE)] <- "Unknown"

# Remove duplicates
credit_data <- credit_data %>% distinct()

# Encode categorical variables using one-hot encoding
dummies <- dummyVars(~., data = credit_data)
credit_data_encoded <- predict(dummies, newdata = credit_data)
credit_data_encoded <- as.data.frame(credit_data_encoded)

# Display the first few rows of the encoded dataset
head(credit_data_encoded)

## Question 1: What is the average total household income for each education level?
# Calculate average total household income for each education level
# Ensure dplyr is loaded
library(dplyr)

# Use the correct column name as per the dataset
average_income_by_education <- credit_data %>%
  group_by(EDUCATION.LEVEL) %>%
  summarise(Average_Income = mean(TOTAL.HOUSEHOLD.INCOME, na.rm = TRUE))

# Format the income in dollars
average_income_by_education$Average_Income <- paste0("$", formatC(average_income_by_education$Average_Income, format = "f", big.mark = ",", digits = 2))

print(average_income_by_education)

## Question - 2 What is the distribution of the number of children in the dataset?
install.packages("ggplot2")

# Load ggplot2 library
library(ggplot2)

# Plot the distribution of the number of children
ggplot(credit_data, aes(x = NO.OF.CHILDREN)) +
  geom_bar(fill = "blue", color = "black") +
  labs(title = "Distribution of Number of Children", x = "Number of Children", y = "Count")

##Question -3 What is the average age of applicants based on their housing type?
library(dplyr)

# Calculate the average age of applicants based on their housing type
average_age_by_housing <- credit_data %>%
  group_by(HOUSING.TYPE) %>%
  summarise(Average_Age = mean(AGE, na.rm = TRUE))

print(average_age_by_housing)

##Intermediate Questions 
#Question -1) How does the number of children affect the total household income, and what does this imply for credit risk?
# Ensure necessary libraries are loaded
library(ggplot2)
library(dplyr)

# Calculate average total household income for each number of children
average_income_by_children <- credit_data %>%
  group_by(NO.OF.CHILDREN) %>%
  summarise(Average_Income = mean(TOTAL.HOUSEHOLD.INCOME, na.rm = TRUE))

# Plot the variation of total household income with the number of children
ggplot(average_income_by_children, aes(x = NO.OF.CHILDREN, y = Average_Income)) +
  geom_bar(stat = "identity", fill = "pink") +
  geom_text(aes(label = paste0("$", formatC(Average_Income, format = "f", big.mark = ",", digits = 2))), 
            vjust = -0.5, size = 3, angle = 90, nudge_y = 10000) +
  labs(title = "Average Total Household Income by Number of Children",
       x = "Number of Children",
       y = "Average Total Household Income") +
  theme_minimal()

#Question -2) What is the relationship between education level and total household income, and what does this imply for credit risk?

# Ensure necessary libraries are loaded
library(ggplot2)
library(dplyr)

# Calculate average total household income by education level
average_income_by_education <- credit_data %>%
  group_by(EDUCATION.LEVEL) %>%
  summarise(Average_Income = mean(TOTAL.HOUSEHOLD.INCOME, na.rm = TRUE))

# Plot the average total household income by education level
ggplot(average_income_by_education, aes(x = EDUCATION.LEVEL, y = Average_Income)) +
  geom_bar(stat = "identity", fill = "red") +
  geom_text(aes(label = paste0("$", formatC(Average_Income, format = "f", big.mark = ",", digits = 2))), 
            vjust = -0.5, size = 3) +
  labs(title = "Average Total Household Income by Education Level",
       x = "Education Level",
       y = "Average Total Household Income") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#Question -3) How does the number of years employed relate to total household income, and what implications does this have for credit risk?
# Ensure necessary libraries are loaded
library(ggplot2)
library(dplyr)

# Plot the relationship between years employed and total household income using a scatter plot
ggplot(credit_data, aes(x = YEARS.EMPLOYED, y = TOTAL.HOUSEHOLD.INCOME)) +
  geom_point(alpha = 0.5, color = "blue") +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  labs(title = "Relationship between Years Employed and Total Household Income",
       x = "Years Employed",
       y = "Total Household Income") +
  theme_minimal()

##Advanced Questions 

#Question -1) How does the distribution of total household income vary across different income types, and what insights can we draw using density plots?
# Ensure necessary libraries are loaded
library(ggplot2)
library(dplyr)

# Density plot of total household income by income type
ggplot(credit_data, aes(x = TOTAL.HOUSEHOLD.INCOME, fill = INCOME.TYPE)) +
  geom_density(alpha = 0.5) +
  scale_x_continuous(labels = scales::dollar_format()) +
  labs(title = "Density Plot of Total Household Income by Income Type",
       x = "Total Household Income",
       y = "Density",
       fill = "Income Type") +
  theme_minimal()

#Question -2) What are the correlations between different numerical variables in the dataset, and how can we visualize these correlations using a heatmap?
install.packages("ggplot2")
install.packages("dplyr")
install.packages("corrplot")
install.packages("magrittr")

# Load necessary libraries
library(ggplot2)
library(dplyr)
library(corrplot)
library(magrittr)

# Simulate a binary target variable 'DEFAULT' for demonstration purposes
set.seed(123)
credit_data$DEFAULT <- sample(0:1, nrow(credit_data), replace = TRUE)

# Prepare the data for correlation analysis
correlation_data <- credit_data %>%
  dplyr::select(TOTAL.HOUSEHOLD.INCOME, YEARS.EMPLOYED, FAMILY.SIZE) %>%
  na.omit()

# Compute the correlation matrix
cor_matrix <- cor(correlation_data)

# Plot the correlation heatmap with customization
corrplot(cor_matrix, method = "color", tl.col = "black", tl.srt = 45, 
         title = "Correlation Heatmap", addCoef.col = "black", number.cex = 0.7, 
         cl.cex = 0.7, tl.cex = 0.8, mar = c(0, 0, 2, 0))

#Question-3) 
# Install necessary packages if not already installed
install.packages("ggplot2")
install.packages("dplyr")
install.packages("lubridate")

# Load necessary libraries
library(ggplot2)
library(dplyr)
library(lubridate)

# Simulate a binary target variable 'DEFAULT' and a date variable for demonstration purposes
set.seed(123)
credit_data$DEFAULT <- sample(0:1, nrow(credit_data), replace = TRUE)
credit_data$DATE <- seq.Date(from = as.Date("2020-01-01"), by = "month", length.out = nrow(credit_data))

# Prepare the data for trend analysis
trend_data <- credit_data %>%
  dplyr::select(DATE, TOTAL.HOUSEHOLD.INCOME, DEFAULT, INCOME.TYPE) %>%
  mutate(MONTH = floor_date(DATE, "month")) %>%
  group_by(MONTH, INCOME.TYPE) %>%
  summarise(Average_Income = mean(TOTAL.HOUSEHOLD.INCOME, na.rm = TRUE),
            Default_Count = sum(DEFAULT, na.rm = TRUE))

# Plot the trend analysis
ggplot(trend_data, aes(x = MONTH)) +
  geom_line(aes(y = Average_Income, color = INCOME.TYPE), size = 1) +
  geom_point(aes(y = Average_Income, color = INCOME.TYPE), size = 2) +
  geom_line(aes(y = Default_Count * 1000, linetype = INCOME.TYPE), color = "red", size = 1) +
  geom_point(aes(y = Default_Count * 1000, shape = INCOME.TYPE), color = "red", size = 2) +
  scale_y_continuous(
    name = "Average Total Household Income",
    sec.axis = sec_axis(~./1000, name = "Number of Defaults")
  ) +
  labs(title = "Trend Analysis of Average Income and Number of Defaults Over Time",
       x = "Month",
       y = "Average Total Household Income",
       color = "Income Type",
       linetype = "Income Type",
       shape = "Income Type") +
  theme_minimal()

# Install necessary packages if not already installed
install.packages("ggplot2")
install.packages("dplyr")
install.packages("caret")
install.packages("pROC")
install.packages("magrittr")
install.packages("ROCR")

# Load necessary libraries
library(ggplot2)
library(dplyr)
library(caret)
library(pROC)
library(magrittr)
library(ROCR)

# Simulate a binary target variable 'DEFAULT' for demonstration purposes
set.seed(123)
credit_data$DEFAULT <- sample(0:1, nrow(credit_data), replace = TRUE)

# Prepare the data for logistic regression
logistic_data <- credit_data %>%
  dplyr::select(DEFAULT, TOTAL.HOUSEHOLD.INCOME, YEARS.EMPLOYED, FAMILY.SIZE, EDUCATION.LEVEL, INCOME.TYPE) %>%
  na.omit()

# Convert categorical variables to factors
logistic_data$EDUCATION.LEVEL <- as.factor(logistic_data$EDUCATION.LEVEL)
logistic_data$INCOME.TYPE <- as.factor(logistic_data$INCOME.TYPE)

# Split the data into training and testing sets
set.seed(123)
train_index <- createDataPartition(logistic_data$DEFAULT, p = 0.7, list = FALSE)
train_data <- logistic_data[train_index, ]
test_data <- logistic_data[-train_index, ]

# Train a logistic regression model
logistic_model <- glm(DEFAULT ~ ., data = train_data, family = binomial)

# Summary of the model
summary(logistic_model)

# Predict on the test set
predicted_probabilities <- predict(logistic_model, newdata = test_data, type = "response")
predicted_classes <- ifelse(predicted_probabilities > 0.5, 1, 0)

# Confusion matrix to evaluate the model
confusion_matrix <- confusionMatrix(as.factor(predicted_classes), as.factor(test_data$DEFAULT))
print(confusion_matrix)

# Plot ROC curve
roc_curve <- roc(test_data$DEFAULT, predicted_probabilities)
plot(roc_curve, main = "ROC Curve for Logistic Regression Model", col = "blue")
auc_value <- auc(roc_curve)
print(paste("AUC:", auc_value))

# Use ROCR package to plot ROC curve with more details
pred <- prediction(predicted_probabilities, test_data$DEFAULT)
perf <- performance(pred, "tpr", "fpr")
plot(perf, col = "blue", main = "ROC Curve with Detailed Information")
abline(a = 0, b = 1, lty = 2, col = "gray")
auc <- performance(pred, measure = "auc")
print(paste("AUC (using ROCR):", auc@y.values[[1]]))

## Gradient Boosting 
install.packages("xgboost")
install.packages("caret")
install.packages("pROC")
install.packages("ROCR")
install.packages("dplyr")
library(xgboost)
library(caret)
library(pROC)
library(ROCR)
library(dplyr)

# Simulate a binary target variable 'DEFAULT' for demonstration purposes
set.seed(123)
credit_data$DEFAULT <- sample(0:1, nrow(credit_data), replace = TRUE)

# Prepare the data for gradient boosting
gb_data <- credit_data %>%
  dplyr::select(DEFAULT, TOTAL.HOUSEHOLD.INCOME, YEARS.EMPLOYED, FAMILY.SIZE, EDUCATION.LEVEL, INCOME.TYPE) %>%
  na.omit()

# Convert categorical variables to numeric
gb_data$EDUCATION.LEVEL <- as.numeric(as.factor(gb_data$EDUCATION.LEVEL))
gb_data$INCOME.TYPE <- as.numeric(as.factor(gb_data$INCOME.TYPE))

# Split the data into training and testing sets
set.seed(123)
train_index <- createDataPartition(gb_data$DEFAULT, p = 0.7, list = FALSE)
train_data <- gb_data[train_index, ]
test_data <- gb_data[-train_index, ]

# Train a Gradient Boosting model
dtrain <- xgb.DMatrix(data = as.matrix(train_data[, -1]), label = train_data$DEFAULT)
dtest <- xgb.DMatrix(data = as.matrix(test_data[, -1]), label = test_data$DEFAULT)
params <- list(objective = "binary:logistic", eval_metric = "auc")
gb_model <- xgboost(params = params, data = dtrain, nrounds = 100)

# Predict on the test set
predicted_probabilities <- predict(gb_model, newdata = dtest)
predicted_classes <- ifelse(predicted_probabilities > 0.5, 1, 0)

# Confusion matrix to evaluate the model
confusion_matrix <- confusionMatrix(as.factor(predicted_classes), as.factor(test_data$DEFAULT))
print(confusion_matrix)

# Plot ROC curve
roc_curve <- roc(test_data$DEFAULT, predicted_probabilities)
plot(roc_curve, main = "ROC Curve for Gradient Boosting Model", col = "blue")
auc_value <- auc(roc_curve)
print(paste("AUC:", auc_value))

# Use ROCR package to plot ROC curve with more details
pred <- prediction(predicted_probabilities, test_data$DEFAULT)
perf <- performance(pred, "tpr", "fpr")
plot(perf, col = "blue", main = "ROC Curve with Detailed Information")
abline(a = 0, b = 1, lty = 2, col = "gray")
auc <- performance(pred, measure = "auc")
print(paste("AUC (using ROCR):", auc@y.values[[1]]))


##Neural Networks 
# Install necessary packages if not already installed
install.packages("neuralnet")
install.packages("caret")
install.packages("dplyr")

# Load necessary libraries
library(neuralnet)
library(caret)
library(dplyr)

# Simulate a binary target variable 'DEFAULT' for demonstration purposes
set.seed(123)
credit_data$DEFAULT <- sample(0:1, nrow(credit_data), replace = TRUE)

# Prepare the data for neural network
nn_data <- credit_data %>%
  dplyr::select(DEFAULT, TOTAL.HOUSEHOLD.INCOME, YEARS.EMPLOYED, FAMILY.SIZE, EDUCATION.LEVEL, INCOME.TYPE) %>%
  na.omit()

# Convert categorical variables to numeric
nn_data$EDUCATION.LEVEL <- as.numeric(as.factor(nn_data$EDUCATION.LEVEL))
nn_data$INCOME.TYPE <- as.numeric(as.factor(nn_data$INCOME.TYPE))

# Split the data into training and testing sets
set.seed(123)
train_index <- createDataPartition(nn_data$DEFAULT, p = 0.7, list = FALSE)
train_data <- nn_data[train_index, ]
test_data <- nn_data[-train_index, ]

# Train a Neural Network model
nn_model <- neuralnet(DEFAULT ~ ., data = train_data, linear.output = FALSE)

# Plot the Neural Network
plot(nn_model)


# Install necessary packages if not already installed
install.packages("rpart")
install.packages("rpart.plot")
install.packages("caret")
install.packages("pROC")
install.packages("ROCR")
install.packages("dplyr")

# Load necessary libraries
library(rpart)
library(rpart.plot)
library(caret)
library(pROC)
library(ROCR)
library(dplyr)

# Simulate a binary target variable 'DEFAULT' for demonstration purposes
set.seed(123)
credit_data$DEFAULT <- sample(0:1, nrow(credit_data), replace = TRUE)

# Prepare the data for decision tree
dt_data <- credit_data %>%
  dplyr::select(DEFAULT, TOTAL.HOUSEHOLD.INCOME, YEARS.EMPLOYED, FAMILY.SIZE, EDUCATION.LEVEL, INCOME.TYPE) %>%
  na.omit()

# Convert categorical variables to factors
dt_data$EDUCATION.LEVEL <- as.factor(dt_data$EDUCATION.LEVEL)
dt_data$INCOME.TYPE <- as.factor(dt_data$INCOME.TYPE)

# Split the data into training and testing sets
set.seed(123)
train_index <- createDataPartition(dt_data$DEFAULT, p = 0.7, list = FALSE)
train_data <- dt_data[train_index, ]
test_data <- dt_data[-train_index, ]

# Train a Decision Tree model
dt_model <- rpart(DEFAULT ~ ., data = train_data, method = "class")

# Plot the Decision Tree
rpart.plot(dt_model, main = "Decision Tree for Credit Risk")

# Predict on the test set
predicted_probabilities <- predict(dt_model, newdata = test_data, type = "prob")[, 2]
predicted_classes <- ifelse(predicted_probabilities > 0.5, 1, 0)

# Confusion matrix to evaluate the model
confusion_matrix <- confusionMatrix(as.factor(predicted_classes), as.factor(test_data$DEFAULT))
print(confusion_matrix)

# Plot ROC curve
roc_curve <- roc(test_data$DEFAULT, predicted_probabilities)
plot(roc_curve, main = "ROC Curve for Decision Tree Model", col = "blue")
auc_value <- auc(roc_curve)
print(paste("AUC:", auc_value))

# Use ROCR package to plot ROC curve with more details
pred <- prediction(predicted_probabilities, test_data$DEFAULT)
perf <- performance(pred, "tpr", "fpr")
plot(perf, col = "blue", main = "ROC Curve with Detailed Information")
abline(a = 0, b = 1, lty = 2, col = "gray")
auc <- performance(pred, measure = "auc")
print(paste("AUC (using ROCR):", auc@y.values[[1]]))
