# Welcome to the Excel Madness Lab... again!
# A great way to get you up to speed on R is to
# go through familiar steps in another language.

# 0: Imports. Import any libraries you might need here.
#    (Hint: 'readxl' is a good one for reading Excel data.
#    You may need to install it.)

# 1a: Create a folder called 'output' where we'll put everything at the end

# 1b: Create a variable called 'files' that's a vector of all the files in the
#     'data' folder.

# 2: Process a single data frame
# 2a: Read in the January 1st data from 'Washington, DC'

# 2b: Read in the PLU codes, call it 'plu'

# 2c: Processing all in one step!
# Unlike in pandas where we're encouraged to do everything separate, in R
# we're encourage to combine all of our steps into one long "pipeline" using
# the tidyverse. So, please do all of our Excel Madness steps in one long
# pipeline. That is, do not create any intermediate variables, just create one
# 'jan1_processed' variable that has:
# - 'price_usd' converted from 'price_eu' (exchange rate = 1.1)
# - 'weight_lb' converted from 'weight_kg' (converation rate = 2.2)
# - Product names merged in from 'plu'
# - Unnecessary/metric columns dropped, if any
# - Add the date as a column called 'date' (e.g., 'Jan 1')

# 3: Functionalize!
# Write a function called 'processData' that takes in two arguments: the file
# name and city. The function outputs the data as processed in Step 2.

# 4: Process all of January's data, just for one city.
# Using the function you created to create a list of data.frames for each
# day of January for Washington, DC. DO NOT USE A LOOP!!!!! If you use a loop
# at any point during this lab, it will be considered incorrect! In R, loops
# are BAD!!!
# (Hint: Use lapply instead!)

# 5: Concatenate the list of data.frames you made in Step 4 into one 'tall'
# data.frame. Use the bind_rows() function.

# 6 (OPTIONAL, CHALLENGE!): Do this for all cities, all data.
# For each of the 10 cities, process the files as you've done in Steps 4 and 5,
# then write that data.frame out to the appropriate output location given
# in the below list. For example, Washington, DC data should go to data/dc.csv.

# NOTE: While this might seem really difficult without a loop (and it is), the
# solution ends up being very short. As with most Functional Programming (FP)
# code, it is much shorter than OOP code but much more difficult to write and
# understand. My solution was 6 lines, 5 of which were used to write a new
# function.

city_map <- list(
  "Atlanta" = "atl.csv",
  "Austin" = "atx.csv",
  "Boston" = "bos.csv",
  "Chicago" = "chi.csv",
  "Denver" = "den.csv",
  "Los Angeles" = "lax.csv",
  "New York" = "nyc.csv",
  "San Francisco" = "sf.csv",
  "Seattle" = "sea.csv",
  "Washington, DC" = "dc.csv"
)

# 7: (DOUBLE BONUS) Create a new file that will run top-to-bottom executing this
# whole process with no excess code.