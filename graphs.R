library("ggplot2")
source("functions.R")


## MAJOR FREQUENCY GRAPH
## takes school name and returns a bar graph with the number of students in that major on the x-axis, and the 
## name of the major along the y-axis 

majorFrequency <- function(school.name) {
  school.major.data <- majorCounter(school.name)
  final.plot <- ggplot(data = school.major.data) +
                  geom_bar(mapping = aes(x = Major, y = Count), stat = "identity") +
                  coord_flip()
  return(final.plot)
}
