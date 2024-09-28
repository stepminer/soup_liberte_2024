# init.R
#
# R code to install packages if not already installed
#

 install.packages("leaflet", repos = "https://cran.rstudio.com/")
my_packages = c("dplyr", "ggplot2", "plotly", "leaflet", "readr")

install_if_missing = function(p) {
  if (p %in% rownames(installed.packages()) == FALSE) {
    install.packages(p, clean = TRUE, quiet = TRUE)
  }
}

invisible(sapply(my_packages, install_if_missing))

my_packages = c("dplyr", "ggplot2", "plotly", "leaflet", "readr")

install_if_missing = function(p) {
  if (p %in% rownames(installed.packages()) == FALSE) {
    install.packages(p, clean = TRUE, quiet = TRUE)
  }
}

invisible(sapply(my_packages, install_if_missing))
