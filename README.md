------------------------------------------------------------------------

editor_options: markdown: wrap: 72 ---

# Lyme-Alert

Tick collection data for developing a ML predictive model that can predict the ranges of latitudes and longitudes ticks are likely to show up in. At first, I'm predicting this just with time and location data, to see if there's any raw movement trends that we can see and observe. Then, I'll look and see if weather data is significantly correlated with those trends (it probably will be).

## So, how does this work?

Find and graph the relationships between spatial data and ticks showing up, and see if that relationship is significant. It probably will be, considering how clustered the data is.

Then, use those data points that we do have to pull from a weather Application Programming Interface (API) and tell us the weather for that day. Temperature, humidity, precipitation, snowfall, all that good stuff. Once we have that, we can see which bits of weather are more correlated with a tick popping up. Probably going to be temperature and humidity, but who knows.

Once we have that trend, we'll be able to see how significant (commonly found) that weather data (high vs. low temps, humidity, precipitation, etc.) is with ticks biting people. If it's found to be significant, we'll put a pin in those.

So, now we can see what the relationship between where you are and the likelihood of ticks being there is through the relationship with the spatial data, and the relationship of the weather and the ticks being there is. We combine those significant factors into our **Machine Learning Model**!!

## What's a Machine Learning Model?

Fantastic question.

Machine Learning (ML) models take the trends that are significant (let's say location, temperature, and precipitation) with tick presence, and match them up to the values a point might have in the future.

I'm interested in knowing if a spot in NYC might have ticks in November, right? The ML model will be able to take the known trends that we've gotten *from real world data* and use those to predict if the location, weather, and date match up with NYC in November.

Now, if I do that on a much wider scale across the entire united states, I'll be able to predict which spots match up to the trends that predict where ticks will be. This way, I can say which areas are high, medium, and low risks of tick bites.

What does this mean for you? You know where to look out for and we can see over time how tick populations are growing, changing, and moving.

## TLDR; P(result = 1 \| latitude, longitude)
