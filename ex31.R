# 0.  a) Check your working directory is in the course folder. Load the .Rproj file if not.
getwd()
#     b) Load the tidyverse package (that includes the readr package)
library(tidyverse)
##
##
##
# 1.  Open the "2010_Census_Populations_by_Zip_Code.csv" file in the exercise-data folder 
#     using the file.show() function
file.show("./exercise-data/2010_Census_Populations_by_Zip_Code.csv")

# 2.  Use read_csv to read the data into R and call the results d1

d1<-read_csv("./exercise-data/2010_Census_Populations_by_Zip_Code.csv")

# 3.  Open the "unhcr_popstats_export_persons_of_concern.csv" file in the exercise-data folder from R
file.show("./exercise-data/unhcr_popstats_export_persons_of_concern.csv")

# 4.  a) Q: How many lines should we skip when reading the data?
#        A: 3
#     b) Q: Are their any missing values (if so how are they represented)?
#        A: no

# 5.  Use read_csv to read the data into R and call the results d2
read_csv("./exercise-data/unhcr_popstats_export_persons_of_concern.csv",skip=3)

# 6.  Save d2 in as "unhcr.csv" in the data file

d2<-read_csv("./exercise-data/unhcr.csv")

# 7.  Open the "tgs00097.tsv" file using the file.show() function
file.show("./exercise-data/tgs00097.tsv")

# 8.  Missing values in this file are represented by ":". 
#     Use read_tsv to read the data into R and call the results d3
#     (Hint: use the na argument)

d3<-read_tsv("./exercise-data/tgs00097.tsv", na=":")
head(d3)

# 9.  Open the "tabell.csv" file using the file.show() function
file.show("./exercise-data/tabell.csv")

# 10. Use read_csv2 or read_delim to read the data into R and call the results d4
#     (Hint: skip the first line)
d4<-read_csv2("./exercise-data/tabell.csv",skip=1)
head(d4)

# 11.  Open the "12411-0013.csv" file using the file.show() function
file.show("./exercise-data/12411-0013.csv")

# 12. Use read_csv2 or read_delim to read the data into R and call the results d5.
#     a) Skip the first 6 rows
#     b) Read in only the first 1472 rows
#     c) Use n0 below (uncomment) to set the column names manually:
d5<-read_csv2("./exercise-data/12411-0013.csv", skip=6, n_max = 1472, col_names = n0)
tbl_df(d5)
head(d5)
 n0 <- c("date", "name", "age",
        "german_male", "german_female", "german_both",
        "foreign_male", "foreign_female", "foreign_both",
         "both_male", "both_female", "both_both")

swiss
tbl_df(swiss)
head(swiss)


