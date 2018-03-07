library("dplyr")

major_data <- read.csv("major_counts.csv")
various_data <- read.csv("school_info.csv")
age_data <- read.csv("school_ages.csv")

## takes in an inputted school and returns a data frame with the left column being the name of the institution, 
## the center column being the majors available at the school, and the right column being its frequency

majorCounter <- function(school.name) {
  filtered <- filter(major_data,institution.name == school.name) %>%
    filter(grepl("All students total", EF2016CP.Major.field.of.study)) %>%
    select(institution.name,EF2016CP.Major.field.of.study,EF2016CP.Grand.total)
  colnames(filtered) <- c("Institution Name", "Major", "Count")
  return(filtered)
}

## Uncomment to check usability
## x <- majorCounter("Eastern Washington University")

## takes in one of three options (from a dropdown menu): Graduation rate, Tuition & Fees, or Student-to-Faculty
## Ratio, and returns a data frame with the left column showing the school name(s) and the right column displaying
## the quantities of the chosen category

quantityFinder <- function(category.name) {
  filtered <- filter(various_data, !is.na(category.name)) %>%
    select(institution.name,category.name)
  return(filtered)
}

## y <- quantityFinder("EF2016D.Student.to.faculty.ratio")

## takes in the school name, the level of student (Undergrad, Grad, or Both) and returns a data frame of the results,
## with the left column representing the institution name, the next column representing the age ranges, and the right
## column representing the related counts of students within that age bracket

ageFinder <- function(school.name,student.level) {
  filtered <- filter(age_data, !is.na(student.level)) %>%
    filter(institution.name == school.name) %>%
    select(institution.name,EF2016B.Age.category,EF2016B.Age.category,EF2016B.Grand.total) %>%
    distinct()
  return(filtered)
}

## z <- ageFinder("Bellevue College", "Undergraduate")