> top_countries <- cardio_data %>%
  +     group_by(country) %>%
  +     summarise(total_trials = sum(trial_count)) %>%
  +     arrange(desc(total_trials)) %>%
  +     slice_head(n = 10)
> 
  > top_countries


top_trend_data <- cardio_data %>%
  +  filter(country %in% top_countries$country) %>%
  +  filter(trial_year <= 2026)


ggplot(data = top_trend_data, aes(x = trial_year, y = trial_count, color = country)) +
  +     geom_line()
> ggplot(data = top_trend_data, aes(x = trial_year, y = trial_count, color = country)) +
  +     geom_line() +
  +     labs(
    +         title = "Cardiovascular Clinical Trial Activity: By Country, from 1983-2026",
    +         subtitle = "Top Ten Countries by Trial Count",
    +         x = "Year",
    +         y = "Cardiovascular Trial Count",
    +         color = "Country",
    +         caption = "Note: Recent years, such as 2024-2026 may be not exact caused by trial registration lag"
    +     ) +
  +     theme_minimal()