# irisApp
Wei Wei  
July 16, 2016  



## What is the irisApp

The irisApp is a simple proof-of-concept, interactive web application that identifies a iris from 3 possible species (setosa, versicolor, virginica) using the combination of 2 sepal and 2 petal measurements. It is built with the R Shiny package from Rstudio, and utilizes the R iris dataset and "random forest" machine learning algorithm. The irisApp is hosted on shinyapps.io server.

#### [Link to the irisApp.][1]

## User manual

User can change the default inputs of sepal length and width, petal length and width using the sliders on the left side-panel. The selected values are reflected in real-time in the main panel on the right.

By clicking the "Submit" button, the likely species information based on the 4 measurements is returned in the main panel with the associated accuracy of the "random forest" prediction model.

To identify another iris of interest, user can adjust the sepal and petal values and obtain the likely species information by re-click the "Submit" button.


[1]: https://alexindata.shinyapps.io/irisApp/ "Link to the irisApp."

