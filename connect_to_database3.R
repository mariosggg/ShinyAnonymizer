             #datatable for the Encrypted Table
# set the path 
setwd("C:/Users/blacklion/Desktop/blacklion")

# loading the libraries for the package#
require("RPostgreSQL")

drv <- dbDriver("PostgreSQL")

# do the connection 
con <- dbConnect(PostgreSQL(), dbname = "db3",
                 host = "localhost", port = 5432,
                 user = "postgres", password = "postgres")


data("PatientCorePopulatedTable")

# creates a data.frame with the necessary columns #
df11<- data.frame(Pat = rownames(PatientCorePopulatedTable), 
                 PatientCorePopulatedTable, 
                 row.names = NULL)



# writes dataframes to the postgreSql database
dbWriteTable(con, "df11",
             value = df11, append = TRUE, row.names = FALSE)


Encrypted=dbGetQuery(con,"select * from public.df11")


                       #datatable for the Hashed Table

#1)md5

#load the data 
data(PatientCorePopulatedTable)


# creates a data.frame with the necessary columns #
df12<- data.frame(PatientsCore = rownames(PatientCorePopulatedTable), 
                 PatientCorePopulatedTable, 
                 row.names = NULL)



#2)sha512
library(digest)
df12$PatientRace<-sapply(df12$PatientRace,digest,algo="sha512")

#crc32
df12$PatientMaritalStatus<-sapply(df12$PatientMaritalStatus,digest,algo="crc32")

#xxhash64
df12$PatientLanguage<-sapply(df12$PatientLanguage,digest,algo="xxhash64")

# writes dataframes to the postgreSql database
dbWriteTable(con, "df12",
             value = df12, append = TRUE, row.names = FALSE)

Hashed=dbGetQuery(con,"select * from public.df12")


                          #datatable for the Anonymized Table

# Replaces factor and character variables by a combination of random sampled letters and numbers. Numeric columns are also transformed, see details#
# the Strings will be replaced by an algorithm with 52/102 chance of choosing a letter and 50/102 chance of choosing a number; then it joins everything in a 5-digits long character string.

df13 <- data.frame(
  PatientID=sample(LETTERS,10),
  PatientGender= sample(LETTERS,10),
  PatientDateOfBirth=sample(LETTERS,10),
  PatientRace=sample(LETTERS,10),
  PatientMaritalStatus=sample(LETTERS,10),
  PatientLanguage=sample(LETTERS,100),
  PatientPopulationPercentageBelowPoverty=sample(1:100)
  
)

# creates a data.frame with the necessary columns #
df13<- data.frame(Patients = rownames(PatientCorePopulatedTable), 
                 PatientCorePopulatedTable, 
                 row.names = NULL)



# technique 1 suppression: In this method certain values of the attributes are replaced by *: update public."df13" set "PatientRace"= '*';

#technique 2 removing information

df13<- df13 %>%
  mutate(PatientGender= sample(1:1000, nrow(PatientCorePopulatedTable)))


# technique 3 Generalization
df13 <- df13 %>%
  mutate(PatientMaritalStatus = ifelse(PatientMaritalStatus < 50000, 0, 
                         ifelse(PatientMaritalStatus>= 50000 & PatientMaritalStatus< 100000, 1, 2)))


# technique 4 bottom coding

df13 <- df13 %>%
  mutate(PatientLanguage = ifelse(PatientLanguage <= 45000, 45000, PatientLanguage))


# writes dataframes to the postgreSql database
dbWriteTable(con, "df13",
             value = df13, append = TRUE, row.names = FALSE)


# take out the frame from databas

Anonymized=dbGetQuery(con,"select * from public.df13")


