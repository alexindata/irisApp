# This is an proof-of-concept of a simple interactive, predictive Shiny app, irisApp
# the app identifies the species of iris from 4 measurements
# ui.R
# Wei Wei
# 07/16/2016

library(shiny)

# Define UI 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Which species of iris is mine?"),
  
  # Sidebar 
  sidebarLayout(
    sidebarPanel(
          sliderInput("sepalLength", "Sepal Length (cm)", value=mean(iris$Sepal.Length), min=min(iris$Sepal.Length), max=max(iris$Sepal.Length), step=0.05),
          sliderInput("sepalWidth", "Sepal Width (cm)", value=mean(iris$Sepal.Width), min=min(iris$Sepal.Width), max=max(iris$Sepal.Width), step=0.05),
          sliderInput("petalLength", "Petal Length (cm)", value=mean(iris$Petal.Length), min=min(iris$Petal.Length), max=max(iris$Petal.Length), step=0.05),
          sliderInput("petalWidth", "Petal Width (cm)", value=mean(iris$Petal.Width), min=min(iris$Petal.Width), max=max(iris$Petal.Width), step=0.05),
          actionButton("goButton", "Submit")
    ),
    
    # Main panel
    mainPanel(
          h3('You entered: '),
          h4("Sepal length: ", verbatimTextOutput("input1")),
          h4("Sepal width: ", verbatimTextOutput("input2")),
          h4("Petal length: ", verbatimTextOutput("input3")),
          h4("Petal width: ", verbatimTextOutput("input4")),
          h2('Your iris is likely a: '),
          strong(verbatimTextOutput("prediction")),
          h4(verbatimTextOutput("text1"))
    )
  )
))



