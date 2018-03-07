library(shiny)
library(ggplot2)

major <- read.table(file = 'Data/major_counts.csv', header = TRUE, sep = ",")
dataset <- read.table(file = 'Data/school_ages.csv', header = TRUE, sep = ",")
school_info <- read.table(file = 'Data/school_info.csv', header = TRUE, sep = ",")

fluidPage(
  
  titlePanel("Washington Colleges"),
  
  sidebarPanel(
    
    sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
                value=min(1000, nrow(dataset)), step=500, round=0),
    
    selectInput('x', 'X', names(dataset), names(dataset)[[6]]),
    selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),
    selectInput('color', 'Color', c('None', names(dataset))),
    
    checkboxInput('jitter', 'Jitter'),
    checkboxInput('smooth', 'Smooth'),
    
    selectInput('facet_row', 'Facet Row', c(None='.', names(dataset))),
    selectInput('facet_col', 'Facet Column', c(None='.', names(dataset)))
  ),
  
  mainPanel(
    plotOutput('plot')
  )
)