# Simple genome browser based on [shiny](https://github.com/rstudio/shiny) and [ggbio](http://www.bioconductor.org/packages/release/bioc/html/ggbio.html)

You'll have to install required packages yourself, see minimal/server.R for dependencies
after that run:
```R
library(shiny)
runGitHub("sgb", "kn3in", subdir="minimal")
```
or have a look at [shiny_example](https://github.com/rstudio/shiny_example)
for alternative ways of running shiny apps.

Caution: at the moment data for the whole genome instead of only current browser view
kept in RAM.

![Example](./img/scrshot.png?raw=true)

