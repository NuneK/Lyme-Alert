graph_NE_year <- function(year) {
  ggplot() +
    geom_polygon(
      data = ne_states,
      aes(x = long, y = lat, group = group),
      fill = "grey25",
      color = "white"
    ) +
    geom_point(
      data = FET %>%
        filter(collection_year == year),
      aes(x = longitude, y = latitude, color = factor(tick_infection)),
      alpha = 0.5,
      size = 1.5
    ) + 
    coord_fixed(1.3) +
    labs(
      color = "Positive Tests",
      title = paste("Dist. in New England", year)
    )
}