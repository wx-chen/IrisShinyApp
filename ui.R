
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Interesting Facts about Iris"),

  # Sidebar with selection of iris species, and a check box of iris images
  sidebarLayout(
    sidebarPanel(
            selectInput('irisspecies', label='What species do you want to see?', 
                        choices=c("All","setosa","versicolor","virginica"),
                        selected="All"),
            checkboxInput('imgs', 'Image of Iris:', value=TRUE),
    
            
            h4("Simple Instructions:"),
            h6("This app use the Iris dataset and gives you some interesting facts about different species of iris :)"),
            helpText("You probably don't need the instructions, but in case you do,"),
            helpText("1. You can use the checkbox (Image of iris) to determine whether you want to see the images of iris displayed"),
            helpText("2. You can use the dropdown manu to select the species of iris you want to plot on the right"),
            helpText("3. The plot on the right displays the length and width of the Petal and Sepal, respectively"),
            h5("That's about it... Enjoy! :D")
            
    ),

    # Show a plot of the Petal/Sepal dimentions of iris
    mainPanel(
      plotOutput("irisplot"),
      
      h3("Image of iris:"),
      imageOutput("setose")
      
    )
  )
))
