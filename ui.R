#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Application to show variation in histogram"),
  headerPanel("My Assignment"),
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("Distribution", "Please Select distribution type",
                  choices = c("Normal", "Exponential")),
      sliderInput("SampleSize","Please select sample size",
                  min = 100, max = 5000, value = 1000, step = 100),
      conditionalPanel(condition = "input.Distribution == 'Normal'",
                       textInput("mean","please select the mean", 10),
                       textInput("sd","please select the standard deviation",3)),
      conditionalPanel(condition = "input.Distribution == 'Exponential'",
                       textInput("lambda", "please select exponential lambda:",1))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
