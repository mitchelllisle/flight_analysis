library(termaticoR)
library(httr)

airport <- as.character(unique(flights$AIRPORT))

allAirports <- NULL
for(i in 1:nrow(airport)){
  url <- paste0("https://en.wikipedia.org/wiki/", airport[i],"_Airport")
  
  args <- toJSON(list(args = list(url = unbox(), selectors = unbox("span.geo-dms"))))
  
  response <- httr::POST(url = "http://localhost:3000/r/termatico/web_scraper", body = args)
  
  data <- content(response)
  
  locationData <- data.frame(airport = airport[i], lat = data$data$data[1])  
}