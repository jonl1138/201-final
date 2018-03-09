library(shiny)
library(ggplot2)
library(DT)

source("graphs.R")
source("functions.R")

fluidPage(
  
  titlePanel("Washington Colleges"),
  p("An interactive app that compares college stats. Data pulled from: https://nces.ed.gov/ipeds/use-the-data"),
  p("Major Plot shows the available majors and their students for a selected college."),
  p("Category Plot compares a selected category for all the colleges."),
  p("Age Plot shows the distribution amoung age groups for a selected college and level of education."),
  p("GitHub: https://github.com/jonl1138/201-final"),
  
  sidebarPanel(
    selectInput('college', 'College', unique(major_data$institution.name)),
    selectInput('category', 'Category', names(various_data)[4:length(various_data)]),
    selectInput('level', 'Level', unique(age_data$EF2016B.Level.of.student))
  ),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Major Plot", plotOutput("majorplot")), 
      tabPanel("Category Plot", plotOutput("quantityplot")), 
      tabPanel("Age Plot", plotOutput("ageplot")), 
      tabPanel("Major Table", DT::dataTableOutput("majortable")),
      tabPanel("Category Table", DT::dataTableOutput("quantitytable")),
      tabPanel("Age Table", DT::dataTableOutput("agetable"))
    )
  )
)