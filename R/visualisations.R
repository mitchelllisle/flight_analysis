lineChart <- function(domesticData, internationalData, colours, title, subtitle, source, link){
  highchart() %>%
  hc_xAxis(categories = domesticData$Year, title = list(enabled = FALSE)) %>% 
  hc_yAxis(title = list(enabled = FALSE)) %>%
  hc_add_series(data = as.numeric(domesticData$totalPassengers), type = "line", color = colours[1], name = "Domestic Flights", label = NULL) %>%
    hc_add_series(data = as.numeric(internationalData$totalPassengers), type = "line", color = colours[2], name = "International Flights", label = NULL) %>%
  # hchart(data, hcaes(maincategory, as.numeric(count), color = colours), type = "column") %>% 
  hc_plotOptions(column = list(dataLabels = list(enabled = TRUE))) %>% 
  hc_chart(height = "400") %>%
  hc_title(text = paste0("<b>", title, "</b>"), align = "left", margin = 20) %>%
  hc_subtitle(text = subtitle, align = "left") %>%
  hc_credits(enabled = TRUE, text = source, href = link, position = list(align = "left", x = 12)) %>%
  hc_add_theme(mlrTheme)
}

flightsPerDay_chart <- function(data, colours, title, subtitle, source, link){
  highchart() %>%
    hc_xAxis(categories = data$AIRPORT, title = list(enabled = FALSE)) %>% 
    hc_yAxis(title = list(enabled = FALSE)) %>%
    hc_add_series(data = as.numeric(data$flightsPerDay), type = "column", color = colours[1], name = "Flights Per Day (Domestic & International)", label = NULL) %>%
    # hchart(data, hcaes(maincategory, as.numeric(count), color = colours), type = "column") %>% 
    hc_plotOptions(column = list(dataLabels = list(enabled = TRUE))) %>% 
    hc_chart(height = "400") %>%
    hc_title(text = paste0("<b>", title, "</b>"), align = "left", margin = 20) %>%
    hc_subtitle(text = subtitle, align = "left") %>%
    hc_credits(enabled = TRUE, text = source, href = link, position = list(align = "left", x = 12)) %>%
    hc_add_theme(mlrTheme)
}

