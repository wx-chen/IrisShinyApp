
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(datasets)
library(ggplot2)
library(dplyr)
# Reshape data into a clean dataset, each row contains observation for 1 part
datas <- iris %>%
        select(Sepal.Length,Sepal.Width,Species) %>%
        mutate(Length=Sepal.Length, Width=Sepal.Width, Part="Sepal") %>%
        select(Length, Width, Part, Species)
datap <- iris %>%
        select(Petal.Length,Petal.Width,Species) %>%
        mutate(Length=Petal.Length, Width=Petal.Width, Part="Petal") %>%
        select(Length, Width, Part, Species)
irisdata <- rbind(datas,datap)


shinyServer(function(input, output) {
        
        # use choices to determine which speicies to display
        datadis <- reactive({
                if (input$irisspecies=="All"){
                        irisdata
                } else {
                        irisdata[(irisdata$Species==input$irisspecies),]
                }
        })
        
        output$irisplot <- renderPlot({
                g <- ggplot(datadis(),aes(Width, Length))
                g + geom_point(aes(color=Species)) + facet_grid(.~Part)

        })
        
        output$setose <- renderImage({
                if(input$imgs){
                        list(src = "setose.png",
                        alt = "image loading error")
                } else {
                        list(src="unselect.png",alt="No image display")
                }
        },deleteFile = FALSE)

#         output$versicolor <- renderImage({
#                 list(src = "versicolor.png",
#                      alt = "error")
#         },deleteFile = FALSE)
#         
#         output$virginica <- renderImage({
#                 list(src = "virginica.png",
#                      alt = "error")
#         },deleteFile = FALSE)
        
        
})
