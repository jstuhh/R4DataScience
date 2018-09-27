# Libraries ---------------------------------------------------------------
library(tidyverse)

# Creating a ggplot -------------------------------------------------------
# TEMPLATE
# ggplot(data = <DATA>) +                               // creates coordinate system
#   <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))          // adds layer (e.g. scatterplot)

# EXAMPLE ("displ" on the x-axis and "hwy" on the y-axis)
ggplot(data = mpg) +                              
  geom_point(mapping = aes(x = displ, y = hwy))   


