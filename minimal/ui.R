library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Wiked Genome Browser"),
  sidebarPanel(
      # get genomic coordinates
	  selectInput("chr", "Chromosome:", 
                      choices=paste0("chr", c(1:22, "X", "Y", "M")),
                      selected="chr9"),
      numericInput("start", "Start:", 36572905),
      numericInput("end",   "End:"  , 36643080)
  ),

  mainPanel(verbatimTextOutput("summary"),
                    plotOutput("tracks"))
))