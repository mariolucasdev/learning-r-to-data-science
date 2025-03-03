library(shiny)

data("airquality", package = "datasets")
names(airquality)

vars<-setdiff(names(airquality), "Ar")

#Interface Gr�fica IU
ui<-pageWithSidebar(
  headerPanel("Qualidade do Ar"),
  sidebarPanel(
    selectInput("colx", "vari�velx", vars),
    selectInput("coly", "vari�vely", vars)
  ),
  mainPanel(plotOutput("plot1"))
)


#C�lculos
server<-function(input, output){
  selectedData<-reactive({
    airquality[,c(input$colx, input$coly)]
  })
  output$plot1<-renderPlot(plot(selectedData()))
}


shinyApp(ui, server)
