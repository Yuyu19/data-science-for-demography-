## ----setup, include=FALSE------------------------------------------------
library(knitr)
knitr::opts_chunk$set(prompt= TRUE, collapse = TRUE, comment = NA)
knitr::knit_hooks$set(purl = hook_purl)

## ----eval=FALSE, prompt=FALSE--------------------------------------------
#  "COUNTRY","YEAR","SAMPLE","SERIAL","GEOLEV1","GEOLEV2","PERNUM","PERWT","AGE","NATIVITY","EDATTAIN","EDATTAIND"
#  591,1960,591196001,1000,591004,591004003,1,20,53,1,1,110
#  591,1960,591196001,1000,591004,591004003,2,20,54,1,1,120
#  591,1960,591196001,1000,591004,591004003,3,20,31,1,1,120
#  591,1960,591196001,1000,591004,591004003,4,20,22,1,2,212
#  591,1960,591196001,1000,591004,591004003,5,20,20,1,2,212
#  591,1960,591196001,1000,591004,591004003,6,20,16,1,2,212
#  591,1960,591196001,1000,591004,591004003,7,20,13,1,2,212
#  591,1960,591196001,1000,591004,591004003,8,20,5,1,0,0
#  591,1960,591196001,1000,591004,591004003,9,20,3,1,0,0
#  591,1960,591196001,1000,591004,591004003,10,20,2,1,0,0
#  591,1960,591196001,2000,591004,591004003,1,20,42,1,1,110
#  591,1960,591196001,3000,591004,591004003,1,20,58,1,1,110
#  591,1960,591196001,3000,591004,591004003,2,20,82,1,1,110
#  ...

## ----eval=FALSE----------------------------------------------------------
#  file.show("./slides-md/data/ipumsi_pan1960.csv")

## ----eval=FALSE, prompt=FALSE--------------------------------------------
#  df0 <- read.csv(file = "./data/ipumsi_pan1960.csv")
#  df0
#  >       COUNTRY YEAR    SAMPLE   SERIAL GEOLEV1   GEOLEV2 PERNUM PERWT AGE NATIVITY EDATTAIN EDATTAIND
#  > 1         591 1960 591196001     1000  591004 591004003      1    20  53        1        1       110
#  > 2         591 1960 591196001     1000  591004 591004003      2    20  54        1        1       120
#  > 3         591 1960 591196001     1000  591004 591004003      3    20  31        1        1       120
#  > 4         591 1960 591196001     1000  591004 591004003      4    20  22        1        2       212
#  > 5         591 1960 591196001     1000  591004 591004003      5    20  20        1        2       212
#  > 6         591 1960 591196001     1000  591004 591004003      6    20  16        1        2       212
#  > 7         591 1960 591196001     1000  591004 591004003      7    20  13        1        2       212
#  > 8         591 1960 591196001     1000  591004 591004003      8    20   5        1        0         0
#  > 9         591 1960 591196001     1000  591004 591004003      9    20   3        1        0         0
#  > 10        591 1960 591196001     1000  591004 591004003     10    20   2        1        0         0
#  > 11        591 1960 591196001     2000  591004 591004003      1    20  42        1        1       110
#  > 12        591 1960 591196001     3000  591004 591004003      1    20  58        1        1       110
#  > 13        591 1960 591196001     3000  591004 591004003      2    20  82        1        1       110
#  > 14        591 1960 591196001     3000  591004 591004003      3    20  57        1        1       110
#  > 15        591 1960 591196001     4000  591004 591004003      1    20  62        1        2       212
#  > 16        591 1960 591196001     4000  591004 591004003      2    20  26        1        2       212
#  > 17        591 1960 591196001     5000  591004 591004003      1    20  42        1        2       212
#  > 18        591 1960 591196001     5000  591004 591004003      2    20  35        1        2       212
#  > 19        591 1960 591196001     5000  591004 591004003      3    20  17        1        2       212
#  > 20        591 1960 591196001     5000  591004 591004003      4    20  15        1        2       212
#  > 21        591 1960 591196001     5000  591004 591004003      5    20   8        1        1       110
#  > 22        591 1960 591196001     5000  591004 591004003      6    20   6        1        0         0
#  > 23        591 1960 591196001     5000  591004 591004003      7    20   4        1        0         0
#  > 24        591 1960 591196001     5000  591004 591004003      8    20  17        1        1       120
#  > 25        591 1960 591196001     5000  591004 591004003      9    20  63        1        1       110

## ---- include=FALSE------------------------------------------------------
df0 <- read.csv(file = "./data/ipumsi_pan1960.csv")

## ---- warning=FALSE, message=FALSE---------------------------------------
library(tidyverse)
df1 <- read_csv(file = "./data/ipumsi_pan1960.csv")
df1

## ---- eval= FALSE, include=FALSE-----------------------------------------
#  write_csv(path = "file.csv", x = read_csv("a,b,c\n1,2,3\n4,5,NA"))
#  read_csv("file.csv", col_names = FALSE)
#  read_csv("file.csv", col_names = c("x", "y", "z"))
#  read_csv("file.csv", n_max = 1)
#  read_csv("file.csv", na = c("4","5","."))

## ---- eval= FALSE, include=FALSE-----------------------------------------
#  write_delim(path = "file2.csv", x = read_csv("a,b,c\n1,2,3\n4,5,NA"), delim = ";")
#  write_delim(path = "file.txt", x = read_csv("a,b,c\n1,2,3\n4,5,NA"), delim = "|")
#  write_delim(path = "file.fwf", x = read_csv("a b c\n1 2 3\n4 5 NA"), delim = "")
#  write_delim(path = "file.tsv", x = read_csv("a,b,c\n1,2,3\n4,5,NA"), delim = "\t")
#  
#  read_csv("file.csv")
#  read_csv2("file2.csv")
#  read_delim("file.txt", delim = "|")
#  read_tsv("file.tsv")

## ----eval=FALSE----------------------------------------------------------
#  write_csv(x = df0, path = "./data/mynewfile.csv")

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/DS4D2018/exercise/ex31.R')----
#  # 0.  a) Check your working directory is in the course folder. Load the .Rproj file if not.
#  getwd()
#  #     b) Load the tidyverse package (that includes the readr package)
#  library(#####)
#  ##
#  ##
#  ##
#  # 1.  Open the "2010_Census_Populations_by_Zip_Code.csv" file in the exercise-data folder
#  #     using the file.show() function
#  
#  # 2.  Use read_csv to read the data into R and call the results d1
#  
#  
#  # 3.  Open the "unhcr_popstats_export_persons_of_concern.csv" file in the exercise-data folder from R
#  
#  # 4.  a) Q: How many lines should we skip when reading the data?
#  #        A: 3
#  #     b) Q: Are their any missing values (if so how are they represented)?
#  #        A: *
#  # 5.  Use read_csv to read the data into R and call the results d2
#  
#  
#  # 6.  Save d2 in as "unhcr.csv" in the data file
#  
#  # 7.  Open the "tgs00097.tsv" file using the file.show() function
#  
#  # 8.  Missing values in this file are represented by ":".
#  #     Use read_tsv to read the data into R and call the results d3
#  #     (Hint: use the na argument)
#  
#  # 9.  Open the "tabell.csv" file using the file.show() function
#  
#  # 10. Use read_csv2 or read_delim to read the data into R and call the results d4
#  #     (Hint: skip the first line)
#  
#  # 11.  Open the "12411-0013.csv" file using the file.show() function
#  
#  # 12. Use read_csv2 or read_delim to read the data into R and call the results d5.
#  #     a) Skip the first 6 rows
#  #     b) Read in only the first 1472 rows
#  #     c) Use n0 below (uncomment) to set the column names manually:
#  # n0 <- c("date", "name", "age",
#  #         "german_male", "german_female", "german_both",
#  #         "foreign_male", "foreign_female", "foreign_both",
#  #         "both_male", "both_female", "both_both")
#  
#  
#  
#  

## ------------------------------------------------------------------------
head(df0)

## ------------------------------------------------------------------------
str(df0)

## ------------------------------------------------------------------------
summary(df0)

## ---- eval=FALSE---------------------------------------------------------
#  View(df0)

## ------------------------------------------------------------------------
# original numeric data
is.factor(df1$NATIVITY); levels(df1$NATIVITY)

# covert to factor
df1$NATIVITY <- factor(df1$NATIVITY)
levels(df1$NATIVITY)

## ------------------------------------------------------------------------
# current order
levels(df1$NATIVITY)

# rename the levels with character strings
df1$NATIVITY <- fct_recode(df1$NATIVITY, "native" = "1", "foreign" = "2", 
                           "missing" = "9")
levels(df1$NATIVITY)

# reorder factors (defined)
df1$NATIVITY <- fct_relevel(df1$NATIVITY, "missing", "foreign", "native")
levels(df1$NATIVITY)

## ------------------------------------------------------------------------
# reorder factors (by descending mean AGE)
df1$NATIVITY <- fct_reorder(df1$NATIVITY, df1$AGE, .fun = mean)
levels(df1$NATIVITY)

# reorder factors (reversed)
df1$NATIVITY <- fct_rev(df1$NATIVITY)
levels(df1$NATIVITY)

# reorder factors (by appearence in data frame)
df1$NATIVITY <- fct_inorder(df1$NATIVITY)
levels(df1$NATIVITY)

## ------------------------------------------------------------------------
# Turn NATIVITY to a character vector
df1$NATIVITY <- as.character(df1$NATIVITY)
head(df1, n = 3)

tbl_df(swiss)

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/DS4D2018/exercise/ex32.R')----
#  # 0.  a) Check your working directory is in the course folder. Load SHU2018-3XS371026.Rproj file if not.
#  getwd()
#  #     b) Load the tidyverse package (that includes the readr package)
#  library(tidyverse)
#  #     c) Run the code in ex32_prelim.R to import the data for this exercise
#  source("./exercise/ex32_prelim.R")
#  ##
#  ##
#  ##
#  # 1.  What are the dimensions of d1 data frame object
#  
#  # 2.  Show a summary of each column of d1
#  
#  # 3.  Show the first three rows of d1
#  #     (Hint: Use head() function. See ?head to set the number of rows)
#  
#  # 4.  Show the column names of d1
#  
#  # 5.  Convert the `name` column in d5 from a character string to a factor
#  
#  # 6.  Show the levels of Origin column
#  
#  # 7.  Reverse the order of the levels for the name column in d5
#  
#  # 8.  Check the order of the new levels
#  
#  # 9.  Reorder the levels of the name column in d5 so that Berlin is the first category.
#  #     (Hint: You only need to type the name of the first category when defining the new order)
#  
#  # 10.  Check the order of the new levels

## ----eval=FALSE, prompt=FALSE--------------------------------------------
#  file.show("./slides-md/data/SAPE18DT14.xls")

## ---- warning=FALSE, cache=FALSE-----------------------------------------
library(readxl)
df2 <- read_excel(path = "./data/SAPE18DT14.xls", sheet = 2, skip = 3)
df2

## ---- eval = FALSE-------------------------------------------------------
#  # install.packages("openxlsx")
#  library(openxlsx)
#  # create a empty workbook to fill
#  wb0 <- createWorkbook(creator = "Guy")
#  # create a empty sheet in the workbook
#  addWorksheet(wb = wb0, sheetName = "small area population")
#  # add your data
#  writeData(wb = wb0, sheet = 1, x = df2)
#  # add a filter and freeze the top row
#  addFilter(wb = wb0, sheet = 1, rows = 1, cols = names(df2))
#  freezePane(wb = wb0, sheet = 1, firstRow = TRUE)
#  
#  ## Save workbook to working directory
#  saveWorkbook(wb0, file = "./data/xlexample.xlsx", overwrite = TRUE)
#  file.show("./slides-md/data/xlexample.xlsx")

## ----eval = FALSE, prompt=FALSE, code = readLines('C:/Users/Guy/Dropbox/DS4D2018/exercise/ex33.R')----
#  # 0. a) Check your working directory is in the course folder. Load the .Rproj file if not.
#  
#  #    b) Load the tidyverse and readxl packages
#  library(tidyverse)
#  library(readxl)
#  ##
#  ##
#  ##
#  # 1. Use read_excel to read data on Male population totals in SAPE18DT14.xls file in the exercise-data folder
#  #    into R and call the results d6
#  
#  
#  d6
#  # 2. Use read_excel to read data on ESTIMATES in WPP2015_FERT_F04_TOTAL_FERTILITY.xls into R and call the results d7
#  
#  
#  d7
#  # 3. Use read_excel to read data on MEDIUM VARIANT in WPP2017_POP_F07_1_POPULATION_BY_AGE_BOTH_SEXES.xlsx
#  #    into R and call the results d8
#  
#  d8
#  # 4. Load the openxlsx package
#  
#  # 5. Complete the following code to save d6 and d7 in two excel sheets of the same file
#  # create workbook
#  wb0 <- #####()
#  # create sheets
#  #####(wb = wb0, sheetName = "England and Wales data")
#  addWorksheet(wb = #####, sheetName = "UN data")
#  # add data
#  #####(wb = wb0, sheet = #####, x = #####)
#  #####(wb = #####, sheet = 2, x = #####)
#  # save workbook
#  #####(wb = #####, file = "./data/myexcel.xlsx")

## ------------------------------------------------------------------------
library(haven)
df3 <- read_sav(file = "./data/ipumsi_pan1960.sav")
df3

## ------------------------------------------------------------------------
print_labels(df3$NATIVITY)

## ------------------------------------------------------------------------
# single column
table(df3$NATIVITY)
df3$NATIVITY <- as_factor(df3$NATIVITY, "labels")
table(df3$NATIVITY)
# all columns
head(df3)
df3 <- as_factor(df3, "labels")
head(df3, n = 3)

## ------------------------------------------------------------------------
# haven
df5 <- read_dta("./data/ipumsi_pan1960.dta")
# gives a tibble
head(df5, n = 3)
df5 <- as_factor(df5)
head(df5, n = 3)

## ------------------------------------------------------------------------
# haven
df7 <- read_sas("./data/ipumsi_pan1960.sas7bdat")
# gives a tibble
head(df7)

## ------------------------------------------------------------------------
# create connection
zf <- unz(description = "./data/ipumsi_pan1960.zip", 
          filename = "ipumsi_pan1960.csv")
zf

## ------------------------------------------------------------------------
# read file from connection
df8 <- read_csv(zf)
df8

