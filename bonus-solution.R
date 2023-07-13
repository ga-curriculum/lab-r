library(tidyverse)
library(readxl)

dir.create('output', showWarnings = FALSE)
files <- list.files('data')

city_map <- list(
  "Atlanta" = "atl.csv",
  "Austin" = "atx.csv",
  "Boston" = "bos.csv",
  "Chicago" = "chi.csv",
  "Denver" = "den.csv",
  "Los Angeles" = "lax.csv",
  "New York" = "nyc.csv",
  "San Francisco" = "sf.csv",
  "Seattle" = "sea.csv",
  "Washington, DC" = "dc.csv"
)

plu <- read.csv('plu-codes.csv')

processData <- function(file, city) {
  readxl::read_xlsx(file.path('data', file), sheet = city) %>% 
    mutate(
      price_usd = price_eu * 1.1,
      weight_lb = weight_kg * 2.2,
      prodcode = as.numeric(prodcode),
      date = gsub('.xlsx', '', date)
    ) %>% 
    left_join(plu, by = c('prodcode' = 'plu_code')) %>% 
    select(-price_eu, -weight_kg)
}

processAndWriteCity <- function(city) {
  lapply(files, processData, city = city) %>%
    bind_rows() %>% 
    write.csv(file.path('output', city_map[[city]]))
}

._ <- lapply(names(city_map), processAndWriteCity)