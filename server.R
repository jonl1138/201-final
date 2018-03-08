library(shiny)
library(ggplot2)
library(DT)
source("functions.R")
source("graphs.R")

function(input, output) {
  agetable <- reactive({ageFinder(input$college, input$level)})
  majortable <- reactive({majorCounter(input$college)})
  quantitytable <- reactive({quantityFinder(input$category)})
  
  output$majorplot <- renderPlot({
    
    p <- majorFrequency(input$college)
    
    print(p)
    
  }, height = 700)
  output$quantityplot <- renderPlot({
    
    p <- quantityFrequency(input$category)
    
    print(p)
    
  }, height = 700)
  output$ageplot <- renderPlot({
    
    p <- agePlot(input$college, input$level)
    
    print(p)
    
  }, height = 700)
  
  output$majortable <- renderDataTable(
    majortable()
  )
  output$quantitytable <- renderDataTable(
    quantitytable()
  )
  output$agetable <- renderDataTable(
    agetable()
  )
}