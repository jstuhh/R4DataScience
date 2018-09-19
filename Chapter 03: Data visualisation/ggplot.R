# Libraries ---------------------------------------------------------------
library(tidyverse)

# Creating a ggplot -------------------------------------------------------
#"displ" on the x-axis and "hwy" on the y-axis
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))


