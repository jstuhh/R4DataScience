# LIBS --------------------------------------------------------------------
library(nycflights13)
library(tidyverse)
# Show dataset in the RStudio viewer
View(flights)
# DPLYR BASICS ------------------------------------------------------------
# Pick observations by their values (filter()).
# Reorder the rows (arrange()).
# Pick variables by their names (select()).
# Create new variables with functions of existing variables (mutate()).
# Collapse many values down to a single summary (summarise()).
# group_by()

# FILTERING ---------------------------------------------------------------
filter(flights, month == 12, day == 1)
filter(flights, month == 11 | month == 12)
filter(flights, month %in% c(11, 12)) # %in% oeprator

# filter() only includes rows where the condition is TRUE; it excludes both FALSE and NA values. 


# COMPARISON --------------------------------------------------------------
# Computers use finite precision arithmetic
(sqrt(2) ^ 2 == 2) # FALSE
(near(sqrt(2) ^ 2,  2)) # TRUE


# ARRANGE -----------------------------------------------------------------
# sort tables
arrange(flights, year, month, day)
arrange(flights, desc(dep_delay))


# SELECTION ---------------------------------------------------------------
select(flights, year, month, day)
# Select all columns between year and day (inclusive)
select(flights, year:day)

# Select all columns except those from year to day (inclusive)
select(flights, -(year:day))

# HELPERS
# starts_with("abc"):   matches names that begin with “abc”.
# ends_with("xyz"):     matches names that end with “xyz”.
# contains("ijk"):      matches names that contain “ijk”.
# matches("(.)\\1"):    selects variables that match a regular expression.

# Move variables to the fron with everything()
select(flights, time_hour, air_time, everything())

?everything()
# RENAME ------------------------------------------------------------------
rename(flights, tail_num = tailnum) #from tailnum to tail_num


# ADD NEW VARIABLES -------------------------------------------------------
mutate(flights_sml,
       gain = dep_delay - arr_delay,
       speed = distance / air_time * 60
)
# If you only want to keep the new variables, use transmute()


# GROUPED SUMMARIES -------------------------------------------------------
# could be important to calculate employees per company (actually it does not. n_distinct should be sufficient)
by_day <- group_by(flights, year, month, day)
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))


# COUNTING ----------------------------------------------------------------





# RELATED TO MY TOPIC
###EXAMPLE
not_cancelled %>% 
  group_by(comp) %>% 
  summarise(employyes = n_distinct(carrier)) %>% 
  arrange(desc(carriers))

#BETTER APPROACH
#--> dt %>% count(company)