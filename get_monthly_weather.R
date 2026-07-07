get_monthly_weather <- function(location_county, state, latitude, longitude) {
  
  url <- paste0(
    "https://archive-api.open-meteo.com/v1/archive?",
    "latitude=", latitude,
    "&longitude=", longitude,
    "&start_date=2018-01-01",
    "&end_date=2024-12-31",
    "&daily=",
    paste(
      c(
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
    ),
    "&timezone=America/New_York"
  )
  
  weather <- fromJSON(url)$daily %>%
    as.data.frame()
  
  weather$date <- as.Date(weather$time)
  
  weather %>%
    mutate(month = floor_date(date, "month")) %>%
    group_by(month) %>%
    summarise(
      temp_mean = mean(temperature_2m_mean, na.rm = TRUE),
      temp_max = mean(temperature_2m_max, na.rm = TRUE),
      temp_min = mean(temperature_2m_min, na.rm = TRUE),
      humidity_mean = mean(relative_humidity_2m_mean, na.rm = TRUE),
      precipitation_sum = mean(precipitation_sum, na.rm = TRUE),
      rain_sum = mean(rain_sum, na.rm = TRUE),
      snowfall_sum = mean(snowfall_sum, na.rm = TRUE),
      precipitation_hours = mean(precipitation_hours, na.rm = TRUE),
      .groups = "drop"
    ) %>%
    mutate(
      location_county = location_county,
      state = state,
      .before = month
    )
}