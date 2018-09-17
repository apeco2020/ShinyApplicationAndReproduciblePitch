# ui.R
# Richard A. Lent
# Monday, September 17, 2018 at 11:05 AM

library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Draw a Graph with the Iris Data"),
  
  sidebarLayout(
    sidebarPanel(
      isolate(
        selectInput("variable", "Select variable", 
                   choices = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"))
        ),
       isolate(
         selectInput("graph", "Select graph type", choices = c("Histogram", "Box Plot", "Scatter Plot"))
         ),
      HTML("<center>"),
      actionButton("go", "Draw graph", style="color: black; 
                     background-color: cyan; border-color: black; margin-top: 0.5em;"),
      HTML("<br>"),
      actionButton("help", "Documentation for this app", style="color: black; 
                     background-color: cyan; border-color: black; margin-top: 0.5em;"),
      HTML("</center>")
       
    ),
    mainPanel(
       plotOutput("thePlot")
    )
  ) # sidebarLayout
) # fluidPage
) # shinyUI
