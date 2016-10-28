library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Finger Print Match"),
  
  sidebarLayout(position="left",
                
                sidebarPanel(
                  h2("Options"),
                  selectInput("recog_sd",label = "Recgonizing SD Range",
                              choices = list("0.01"=0.01,"0.005"=0.005,"0.002"=0.002,"0.001"=0.001,"0.0001"=0.0001),selected = 0.005),
                  sliderInput("number_of_people", label = h3("Number of People"), min = 1, 
                              max = 100, value = 20)
                  
                ),
                mainPanel(h1("Output Roc Curve",align='center'),
                          plotOutput("myggbiplot")
                )
  ) 
))