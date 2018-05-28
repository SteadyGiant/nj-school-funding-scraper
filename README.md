# nj-school-funding-scraper
### Scrapes April 2018 (full) school funding scenarios from NJ Spotlight.

## Intro

NJ Spotlight ran a story, ["What Would ‘Full Funding’ of School Aid Look Like? Add $2.3B to Districts"](http://www.njspotlight.com/stories/18/04/24/what-would-full-funding-of-school-aid-look-like-add-2-3b-to-budget/), and made [the data](http://www.njspotlight.com/tables/School%20funding%20scenarios%2018/#/p/1) public. The State of NJ makes the April 2018 school funding scenarios data [public already](http://www.nj.gov/education/stateaid/1718/scenarios.shtml), but NJ Spotlight's dataset contains more variables.

I can't download the whole thing in one go, and I don't feel like clicking through 24 pages and copy+pasting each one into a spreadsheet, so scrape I shall!

## Issues

This website is dynamically generated ("Javascript is modifying the state of the DOM"), so `rvest`'s functions cannot extract the data. [`rdom`](https://github.com/cpsievert/rdom) takes care of this. 

The catch: It seems like `rvest` and `xml2` have no functions capable of dealing with the output of `rdom`'s functions. `XML::readHTMLTable()`, however, does the job.

## Requirements

For `rdom` to work, you must have `phantomjs.exe` in the working directory. You can [download it here](http://phantomjs.org/). You only need to move the `phantomjs.exe` file into your working directory. I used v2.1.