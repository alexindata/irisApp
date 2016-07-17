# This is an proof-of-concept of a simple interactive, predictive Shiny app, irisApp
# the app identifies the species of iris from 4 measurements
# server.R
# Wei Wei
# 07/16/2016

## random forest modeling of the iris data
library(shiny)
library(randomForest)
data(iris)
set.seed(1234)

ind <- sample(2, nrow(iris), replace = TRUE, prob = c(0.6, 0.4))
training <- iris[ind == 1, ]
testing <- iris[ind == 2, ]
rfMod <- randomForest(Species ~., data=training, importance=TRUE)
predict <- predict(rfMod, testing)
accuracy <- nrow(testing[testing$Species == predict, ]) / nrow(testing)
accuracy <- round(accuracy * 100, 2)

# the shinyapps.io server has issues with using the caret package
# confusionMatrix is from the caret package
# result <- confusionMatrix(predict, iris[ind == 2, ]$Species)
# accuracy <- round(as.numeric(result$overall[1]) * 100, 2)

# output
shinyServer(
      function(input, output) {
            output$input1 <- renderText({input$sepalLength})
            output$input2 <- renderText({input$sepalWidth})
            output$input3 <- renderText({input$petalLength})
            output$input4 <- renderText({input$petalWidth})
            
            output$prediction <- eventReactive(input$goButton, {
                  newdata <- data.frame("Sepal.Length"=input$sepalLength, "Sepal.Width"=input$sepalWidth, "Petal.Length"=input$petalLength, "Petal.Width"=input$petalWidth)
                  pred <- predict(rfMod, newdata=newdata)
                  as.character(pred)
            })
            output$text1 <- eventReactive(
                  input$goButton, 
                  paste("The accuracy of the prediction model is", accuracy, "percent.")
            )
      }
)


