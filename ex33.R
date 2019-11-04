# 0. a) Check your working directory is in the course folder. Load the .Rproj file if not.

#    b) Load the tidyverse and readxl packages
library(tidyverse)
library(readxl)
##
##
##
# 1. Use read_excel to read data on Male population totals in SAPE18DT14.xls file in the exercise-data folder 
#    into R and call the results d6
d6<- read_excel("C:/Users/18800/Desktop/data science for demography/handout/exercise-data/SAPE18DT14.xls")
d6<- read_excel(".//exercise-data/SAPE18DT14.xls",skip=3,sheet=3)

df6<- read.table(".//exercise-data/SAPE18DT14.xls",skip=3,sheet=3)
# 2. Use read_excel to read data on ESTIMATES in WPP2015_FERT_F04_TOTAL_FERTILITY.xls into R and call the results d7

d7<-read_excel("./exercise-data/WPP2015_FERT_F04_TOTAL_FERTILITY.xls",sheet=1,skip=16)

# 3. Use read_excel to read data on MEDIUM VARIANT in WPP2017_POP_F07_1_POPULATION_BY_AGE_BOTH_SEXES.xlsx 
#    into R and call the results d8

d8<-read_excel("./exercise-data/WPP2017_POP_F07_1_POPULATION_BY_AGE_BOTH_SEXES.xlsx",sheet=2,skip=16)
d8
                 
# 4. Load the openxlsx package
library(openxlsx)

# 5. Complete the following code to save d6 and d7 in two excel sheets of the same file
# create workbook
wb0 <- createWorkbook(creator = "Yuyu")
# create sheets
addWorksheet(wb = wb0, sheetName = "England and Wales data")
addWorksheet(wb = wb0, sheetName = "UN data")
# add data
writeData(wb = wb0, sheet = 1, x = d6)
writeData(wb = wb0, sheet = 2, x = d7)
# save workbook
saveWorkbook(wb = wb0, file = "./exercise-data/myexcel.xlsx")
