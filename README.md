<!-- README.md is generated from README.Rmd. Please edit that file -->
Overview
--------

Desrciption of `vispear` package.

Installation
------------

Copy the chunk of code and paste it to R console or RStudio IDE. Please keep in mind to install necessary packages i.e. `devtools`, `keyring` and `rstudioapi` if you haven't installed them yet.

``` r
# Install these packages
# install.packages("devtools")
# install.packages("keyring")
# install.packages("rstudioapi")
require(devtools) 
require(keyring)
require(rstudioapi) 

##### CHANGE THIS LINE START #####
login <- "example" #Put your bitbucket login
##### CHANGE THIS LINE END #######

repo <- "bitbucket.pearson.com/scm/ef/vispear.git"

# https address where the package is stored
url <- paste0("https://", login, "@", repo)
  
# Install ENR package
devtools::install_git(url = url,
    credentials = git2r::cred_user_pass(
      login,
      rstudioapi::askForPassword("Bitbucket password:")),
    build_vignettes = TRUE
  )
```
