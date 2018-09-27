# Libraries ---------------------------------------------------------------
library(tidyverse)

# Creating a ggplot -------------------------------------------------------
#=== GENERAL TEMPLATE ===
#ggplot(data = <DATA>) +           // creates coordinate system
#  <GEOM_FUNCTION>(                // adds layer (e.g. scatterplot)
#    mapping = aes(<MAPPINGS>),
#    stat = <STAT>, 
#    position = <POSITION>
#  ) +
#  <COORDINATE_FUNCTION> +
#  <FACET_FUNCTION>


#=== AESTHETICS ===
# Map aesthetics INSIDE aes() after coordinates:
#   - color
#   - size
#   - alpha (transparency)
#   - shape
#   - group
#   - stroke (???)
#
#   --> geom_point(mapping = aes(x = displ, y = hwy, shape = class)) 
#
# aesthetics can also be set manually OUTSIDE aes():
#   - color = "string"
#   - size = "mm"
#   - shape = "0-24" (0-14 have a border determined by color. They can be filled with "fill")
#
#   - geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
#
# example
ggplot(data = mpg) +                              
  geom_point(mapping = aes(x = displ, y = hwy, color = class), position = "jitter")   #position = jitter reveals actual data points
#

#=== FACETS ===
# facet_wrap
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 7) #nrow is the number of rows of plots
# facet_grid (facet plot on the combination of one/two variables)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl) # if just on --> replace with .
#
#=== GEOM OBJECTS ===
#geom_point, geom_smooth, geom_bar, geom_bar, geom_freqpoly, ...
#
# EXAMPLE for smooth
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))
#
# EXAMPLE for multiple objects (added by +)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

# shorter
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

# with different mapping and filters
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE) # se is the standard deviation

# BAR CHARTS
# EXAMPLE for default
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut)) # y-default is count (default stat)
# EXAMPLE for chosen values (explanation of trible later) <- might be also achieved with geom_col? 
demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)

ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity") # the stat "identity" enables mapping of the heigt to raw values of a varuable

# EXAMPLE for two different variables
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))

# EXAMPLE for stat_summary
ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )

# STACKED BAR CHARTS (will be accomplished by the fill attribute)
# EXAMPLE
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))
# 100 % charts (position attribute)
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")
# Grouping (dodge)
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

#=== ADDITIONAL ===
#coord_flip

