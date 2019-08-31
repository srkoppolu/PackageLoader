
PackageLoad <- function(reqd.packages = NULL){
  
  # Load the required package for using the function: isPackageLoaded() first
  require(R.utils)
  cat("\014")
  
  missing.packages <- reqd.packages[!(reqd.packages %in% as.character(installed.packages()[,'Package']))]
  if(length(missing.packages) > 0) install.packages(missing.packages)
  
  missing.packages <- reqd.packages[!(reqd.packages %in% as.character(installed.packages()[,'Package']))]
  source("https://bioconductor.org/biocLite.R")
  if(length(missing.packages) > 0) lapply(missing.packages, biocLite)
  cat("\014") 
  
  toload.packages <- as.list(reqd.packages[!isPackageLoaded(reqd.packages)])
  lapply(toload.packages, require, character.only = T)
  cat("\014") 
  
}