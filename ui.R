library(shiny)
library(ggplot2)
library(DT)

source("graphs.R")
source("functions.R")

fluidPage(
  
  titlePanel("Washington Colleges"),
  p("An interactive app that compares college stats. Data pulled from: https://nces.ed.gov/ipeds/use-the-data"),
  p("GitHub: https://github.com/jonl1138/201-final"),
  
  sidebarPanel(
    selectInput('college', 'College', unique(major_data$institution.name)),
    selectInput('category', 'Category', names(various_data)[4:length(various_data)]),
    selectInput('level', 'Level', age_data$EF2016B.Level.of.student)
  ),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Major Plot", plotOutput("majorplot")), 
      tabPanel("Quantity Plot", plotOutput("quantityplot")), 
      tabPanel("Age Plot", plotOutput("ageplot")), 
      tabPanel("Major Table", DT::dataTableOutput("majortable")),
      tabPanel("Quantity Table", DT::dataTableOutput("quantitytable")),
      tabPanel("Age Table", DT::dataTableOutput("agetable"))
    )
  )
)