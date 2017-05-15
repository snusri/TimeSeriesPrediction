
library(tseries)

data("AirPassengers")
plot(AirPassengers)
abline(reg = lm(AirPassengers~time(AirPassengers)))
cycle(AirPassengers)

plot(aggregate(AirPassengers, FUN = mean))
boxplot(AirPassengers~cycle(AirPassengers))
adf.test(diff(log(AirPassengers)), alternative = 'stationary', k=0)

acf(log(AirPassengers))
pacf(log(AirPassengers))
acf(diff(log(AirPassengers)))
pacf(diff(log(AirPassengers)))
fit <- arima(log(AirPassengers), c(0, 1, 1),seasonal = list(order = c(0, 1, 1), period = 12))

pred <- predict(fit, n.ahead = 10*12)


ts.plot(AirPassengers,2.718^pred$pred, log = "y", lty = c(1,3))