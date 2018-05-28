scrape_page = function(page_num) {

  library(magrittr)
  library(rdom)
  library(tibble)
  library(XML)

  try(

    expr = {

      url = paste0('http://www.njspotlight.com/tables/School funding scenarios 18/#/p/',
                   as.character(page_num))

      sd_data = matrix(NA, nrow = 25, ncol = 10) %>%
        as_tibble()

      while (all(is.na(sd_data))) {

        # current_page = rvest::html_session(url = url)

        sd_data = rdom::rdom(url = url, css = '#d3', all = TRUE) %>%
          XML::readHTMLTable(header = TRUE) %>%
          as_tibble()

      }

      return(sd_data)

    }

  )

}