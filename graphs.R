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

#m <- majorFrequency("Eastern Washington University")
#print(m)


quantityFrequency <- function (category) {
  filteredCategory <- quantityFinder(category)
  plot <- ggplot(filteredCategory, aes(x = institution.name, y = category)) +
    geom_bar(stat = "identity") +
    theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
    labs(x = "Institution Name") +
    labs(y = "Student to Faculty Ratio")
  return(plot)
}

#q <- quantityFrequency("EF2016D.Student.to.faculty.ratio")
#print(q)

agePlot <- function(school.name, student.level) {
  data <- ageFinder(school.name, student.level)
  plot <- ggplot(data, aes(x = EF2016B.Age.category, y = EF2016B.Grand.total)) +
    geom_bar(stat = "identity") + labs(x = "Age Category") + labs(y = "Total") +
    theme(axis.text.x = element_text(angle = 60, hjust = 1))
  return(plot)
}

#print(agePlot("Bellevue College", "Undergraduate"))