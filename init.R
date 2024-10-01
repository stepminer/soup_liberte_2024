# init.R
#
# R code to install packages if not already installed
#
# CRAN version
#install.packages('leaflet')

# Or Github version
#if (!require('devtools')) install.packages('devtools')
#devtools::install_github('rstudio/leaflet')
 
#helpers.installPackages('dplyr', 'ggplot2','shiny', 'leaflet', 'readr')
# init.R
#
# Example R code to install packages if not already installed
#

my_packages = c('dplyr', 'ggplot2','leaflet', 'readr')

install_if_missing = function(p) {
  if (p %in% rownames(installed.packages()) == FALSE) {
    install.packages(p, clean=TRUE, quiet=FALSE)
  }
}

invisible(sapply(my_packages, install_if_missing))
