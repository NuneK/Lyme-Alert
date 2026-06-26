library(httr2)
library(jsonlite)
library(dplyr)

scrape_weather <- function(latitude, longitude, date) {
  
  date <- as.Date(date)
  
  url <- "https://archive-api.open-meteo.com/v1/archive"
  
  response <- request(url) %>%
    req_url_query(
      latitude = latitude,
      longitude = longitude,
      start_date = date,
      end_date = date,
      daily = paste(
        c(
          "weather_code",
          "temperature_2m_mean",
          "temperature_2m_max",
          "temperature_2m_min",
          "relative_humidity_2m_mean",
          "precipitation_sum",
          "rain_sum",
          "snowfall_sum",
          "precipitation_hours"
        ),
        collapse = ","
      )
    ) %>%
    req_perform()
  
  dat <- resp_body_json(response)
  
  tibble(
    latitude = latitude,
    longitude = longitude,
    date = date,
    weather_code = dat$daily$weather_code,
    temperature_mean = dat$daily$temperature_2m_mean,
    temperature_max = dat$daily$temperature_2m_max,
    temperature_min = dat$daily$temperature_2m_min,
    humidity_mean = dat$daily$relative_humidity_2m_mean,
    precipitation_sum = dat$daily$precipitation_sum,
    rain_sum = dat$daily$rain_sum,
    snowfall_sum = dat$daily$snowfall_sum,
    precipitation_hours = dat$daily$precipitation_hours
  )
}