library("ggplot2")
source("functions.R")


## MAJOR FREQUENCY GRAPH
## takes in a data frame and school name and returns a bar graph with the middle column along the x-axis, and the 
## right column along the y-axis 

majorFrequency <- function(school.name) {
  major.data <- majorCounter(school.name)
  #final.plot <- ggplot(data = majorCounter(major.data))
  plot <- ggplot(major.data, aes(x = Major, y = Count)) + geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1))
  return(plot)
}

m <- majorFrequency("Eastern Washington University")
print(m)

## 
quantityFrequency <- function (category) {
  filteredCategory <- quantityFinder(category)
  plot <- ggplot(filteredCategory, aes(x = institution.name, y = EF2016D.Student.to.faculty.ratio)) + geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1)) + labs(x = "Institution Name") + labs(y = "Student to Faculty Ratio")
  return(plot)
}

q <- quantityFrequency("EF2016D.Student.to.faculty.ratio")
print(q)
