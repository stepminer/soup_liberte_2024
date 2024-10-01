# init.R
#
# R code to install packages if not already installed
#
# CRAN version
 apt-get install   make          
 apt-get install   pandoc        
 apt-get install   libpng-dev     
 apt-get install   libgdal-dev    
 apt-get install   gdal-bin      
 apt-get install   libgeos-dev   
 apt-get install   libproj-dev   
 apt-get install   libsqlite3-dev 




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
