# nj-school-funding-scraper
### Scrapes April 2018 full school funding scenarios from NJ Spotlight.

## Intro

NJ Spotlight ran a story, ["What Would ‘Full Funding’ of School Aid Look Like? Add $2.3B to Districts"](http://www.njspotlight.com/stories/18/04/24/what-would-full-funding-of-school-aid-look-like-add-2-3b-to-budget/), and made [the data](http://www.njspotlight.com/tables/School%20funding%20scenarios%2018/#/p/1) public. I can't download the whole thing in one go, and I don't feel like clicking through 24 pages and copy+pasting each one into a spreadsheet, so scrape I shall!

## Data

This dataset includes capped SFRA aid, including adjustment aid, for [2018-19 school year](http://www.nj.gov/education/stateaid/1819/) as well as actual state aid [recieved in 2017-18](http://www.nj.gov/education/stateaid/1718/scenarios.shtml). However, NJ Spotlight also obtained *uncapped* SFRA aid *without* adjustment aid. It doesn't seem like this variable is made publicly available by the State. Ideally, I'd like to also have adjustment aid as a separate variable.

## Results

The full dataset is in the `data/` folder. It contains funding scenarios for all(?) school districts in NJ.

## Instructions

If you want to copy me, just run all lines of `R/compile_data.R`. See "Requirements" below for dependencies.

## Challenges

This website is dynamically generated ("Javascript is modifying the state of the DOM"), so `rvest`'s functions cannot extract the data. [`rdom`](https://github.com/cpsievert/rdom) takes care of this. 

The catch: It seems like `rvest` and `xml2` have [no functions capable](https://github.com/cpsievert/rdom/issues/16) of dealing with the output of `rdom`'s functions. `XML::readHTMLTable()`, however, does the job.

## Requirements

For `rdom` to work, you must have `phantomjs.exe` in the working directory. You can [download it here](http://phantomjs.org/). You only need to move the `phantomjs.exe` file into your working directory. I used v2.1.1, the last stable version that will ever(?) be released (RIP).

Alternatively, you can probably download PhantomJS using the [`wdman`](https://github.com/johndharrison/wdman) package.
