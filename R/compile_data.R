library(dplyr)
library(magrittr)
library(tibble)

source('R/scrape_page.R')

# There are 24 pages to parse.
pages = vector(mode = 'list', length = 24)

for (page in 1:length(pages)) {

  while (!'tbl_df' %in% class(pages[[page]])) {

    pages[[page]] = scrape_page(page_num = page)

    Sys.sleep(1)

  }

}

all_pages = dplyr::bind_rows(pages)

saveRDS(object = all_pages, file = 'data/scenarios_Apr2018.Rds')