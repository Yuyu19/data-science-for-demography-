## ----setup, include=FALSE------------------------------------------------
library(knitr)
knitr::opts_chunk$set(prompt= TRUE, collapse = TRUE, comment = NA)
knitr::knit_hooks$set(purl = hook_purl)

## ----echo = TRUE---------------------------------------------------------
5 + 3
15.3 * 23.4
sqrt(16)

## ----echo = TRUE---------------------------------------------------------
5 + 3
15.3 * 23.4
sqrt(16)

## ----echo = TRUE---------------------------------------------------------
# simple commands
1 + 1
mean(x = c(1,5,6))

## ----echo = TRUE, eval=FALSE---------------------------------------------
#  # create some objects to view
#  x <- 1:10
#  d <- cars

## ----echo = TRUE, eval=FALSE---------------------------------------------
#  # example plot of the cars data set (speed vs stopping distances)
#  plot(cars)

## ----echo = TRUE, eval=FALSE---------------------------------------------
#  # view the help file for the logarithm function:
#  ?log

## ---- eval=FALSE---------------------------------------------------------
#  ?log

## ---- eval=FALSE---------------------------------------------------------
#  help("+")

## ------------------------------------------------------------------------
example("mean")

## ---- eval=FALSE---------------------------------------------------------
#  # is there a median function in R?
#  ??median

## ---- eval=FALSE---------------------------------------------------------
#  help.start()

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("readxl")

## ---- eval=FALSE---------------------------------------------------------
#  # i heard about read_excel on the web.. what does it do...
#  ?read_excel
#  
#  # oh.. i need to load the library of the read_excel function first
#  library(readxl)
#  ?read_excel

## ---- eval=FALSE---------------------------------------------------------
#  update.packages()

## ---- eval=FALSE---------------------------------------------------------
#  # install.packages("installr")
#  library(installr)
#  installr()

