
library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Biplot 4 Smari"),
  
 sidebarLayout(position="left",
               
   sidebarPanel(
     h2("Options"),
     fileInput("file", label = h4("Import Excel File"),accept = c(".xlsx",".XLSX")),
     selectInput("percentage",label = "Ratio of Total Dots to Plot",
                 choices = list("5%"=0.05,"10%"=0.1,"20%"=0.2,"50%"=0.5,"100%"=1),selected = 1),
     # numericInput("percentage", label = h4("Indicate Percentage of Points shown (0~1)"),value=1),
     textInput("vecs",label = h4("Indicate features shown"), value=NULL),
     sliderInput("alpha", label = h3("Transparency"), min = 0, 
                 max = 1, value = 1),
     checkboxGroupInput("choices", label = h4("hoose PCA Vectors"), 
                        choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3,'Choice 4'=4),
                        selected = c(1,2))
     ),
   
   mainPanel(h1("Output Biplot",align='center'),
             plotOutput("myggbiplot")
              )
 ) 
))