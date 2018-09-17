# server.R
# Richard A. Lent
# Monday, September 17, 2018 at 11:06 AM


library(shiny)

shinyServer(function(input, output) {
  
  data(iris)
  attach(iris)
  
  observeEvent(input$help, {
    helpContent <- HTML("This <a href='https://shiny.rstudio.com/' target='_blank'>Shiny</a>
                         app draws three different types of univariate graphs
                        (<a href='https://stat.ethz.ch/R-manual/R-devel/library/graphics/html/hist.html'
                         target='_blank'>
                         histogram</a>, 
                         <a href='https://stat.ethz.ch/R-manual/R-devel/library/graphics/html/boxplot.html'
                         target='_blank'>
                         box plot</a>, 
                         <a href='https://stat.ethz.ch/R-manual/R-devel/library/graphics/html/plot.html' 
                         target='_blank'>
                         scatter plot</a>) using the 
                        <a href='https://www.math.ucla.edu/~anderson/rw1001/library/base/html/iris.html'
                        target='_blank'>Iris dataset</a>. Select a variable and a graph type using the
                        drop-down lists, then press
                        the <b>Draw graph</b> button to draw the graph. You can select any combination of
                        variable and graph type. Press the <b>Draw graph</b> button again to re-draw the graph
                        after making different selections.<br><br>
                        The code files <code>ui.R</code> and <code>server.R</code> for this app can
                        be found on 
                        <a href='https://github.com/richardlent/ShinyApplicationAndReproduciblePitch'
                         target='_blank'>
                        GitHub</a>.")
    showModal(modalDialog(
      title = HTML("<center><h3>Documentation</h3></center>"), helpContent
    ))
  }) # observeEvent(input$help
  
  observeEvent(input$go, {
    output$thePlot <- renderPlot({
      isolate(
        switch (input$graph,
              "Histogram" = hist(iris[, input$variable], main = input$variable, xlab = ""),
              "Box Plot" = boxplot(iris[, input$variable], main = input$variable),
              "Scatter Plot" = plot(iris[, input$variable], main = input$variable))
      )
    })
  })
  
}) # shinyServer



