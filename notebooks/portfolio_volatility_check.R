# Load the daily balances for both portfolios
test_values <- read.csv(file.choose(), check.names = FALSE)
# Calculate daily returns from the portfolio balances
equal_values <- c(1000000, test_values[["Equal Weight"]])
optimised_values <- c(1000000, test_values[["Optimised"]])
# Recreate daily returns before calculating volatility
equal_returns <- diff(equal_values) / head(equal_values, -1)
optimised_returns <- diff(optimised_values) / head(optimised_values, -1)
# Calculate and display annualized volatility for both portfolios
equal_volatility <- sd(equal_returns) * sqrt(252) * 100
optimised_volatility <- sd(optimised_returns) * sqrt(252) * 100

print(round(equal_volatility, 2))
print(round(optimised_volatility, 2))
head(equal_returns)
head(optimised_returns)