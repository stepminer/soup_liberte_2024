# init.R
#
# R code to install packages if not already installed
#
# CRAN version
install.packages('leaflet')

# Or Github version
#if (!require('devtools')) install.packages('devtools')
#devtools::install_github('rstudio/leaflet')
 
helpers.installPackages('dplyr', 'ggplot2','shiny', 'leaflet', 'readr')

