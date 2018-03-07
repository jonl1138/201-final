library("ggplot2")
source("functions.R")


## MAJOR FREQUENCY GRAPH
## takes in a data frame and school name and returns a bar graph with the middle column along the x-axis, and the 
## right column along the y-axis 

majorFrequency <- function(df,school.name) {
  major.data <- majorCounter(school.name)
  final.plot <- ggplot(data = majorCounter(major.data)) +
      
}
