library(graphics)
library(utils)
library(base)
library(parsedate)

data<-read.csv('C:/Users/sonali/Downloads/train_df.csv')
pred <- read.csv('C:/Users/sonali/Downloads/predictions.csv')


colnames(pred)<-c("date","low_pred", "high_pred", "precip_pred", "hum_pred", "pressure_pred", "weather_pred")
data$low_pred <- pred["low_pred"]
data$high_pred <- pred["high_pred"]
data$precip_pred <- pred["precip_pred"]
data$hum_pred <- pred["hum_pred"]
data$pressure_pred<-pred["pressure_pred"]
data$weather_pred<-pred["weather_pred"]

head(data)

library(lubridate)
data$date <- as_datetime(data$date)

library(ggplot2)

#For Low Temp
data$low_pred <- unlist(data$low_pred)
data$temperatureLow <- unlist(data$temperatureLow)
ggplot(data, aes(x = date,group = 1)) +
  geom_line(aes(y = low_pred, color = "predicted")) + 
  ggtitle("Predicted vs Actual Low Temperature") +
  geom_line(aes(y = temperatureLow, color = "actual")) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

#For High Temp
data$high_pred <- unlist(data$high_pred)
data$temperatureHigh<- unlist(data$temperatureHigh)
ggplot(data, aes(x = date,group = 1)) +
  geom_line(aes(y = high_pred, color = "predicted")) + 
  ggtitle("Predicted vs Actual High Temperature") +
  geom_line(aes(y = temperatureHigh, color = "actual")) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

#For Precip Probability
data$precip_pred <- unlist(data$precip_pred)
data$temperatureHigh<- unlist(data$precipProbability)
ggplot(data, aes(x = date,group = 1)) +
  geom_line(aes(y = precip_pred, color = "predicted")) + 
  ggtitle("Predicted vs Actual Precipitation Probability") +
  geom_line(aes(y = precipProbability, color = "actual")) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

#For Humidity
data$hum_pred <- unlist(data$hum_pred)
data$humidity<- unlist(data$humidity)
ggplot(data, aes(x = date,group = 1)) +
  geom_line(aes(y = hum_pred, color = "predicted")) + 
  ggtitle("Predicted vs Actual Humidity") +
  geom_line(aes(y = humidity, color = "actual")) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

#For Pressure
data$pressure_pred <- unlist(data$pressure_pred)
data$pressure<- unlist(data$pressure)
ggplot(data, aes(x = date,group = 1)) +
  geom_line(aes(y = pressure_pred, color = "predicted")) + 
  ggtitle("Predicted vs Actual Pressure") +
  geom_line(aes(y = pressure, color = "actual")) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

