library(shiny)
require(openxlsx)
library(ggplot2)
library(plyr)
library(dplyr)
library(ggbiplot)
library(HDclassif)
source("myggbiplot.R")


shinyServer(function(input,output){
  
  output$myggbiplot <- reactivePlot(function(){
    selected = (input$cols)
    inputAlpha = as.numeric(input$alpha)
    inputPercentage = as.numeric(input$percentage)
    inputChoices = as.numeric(input$choices)
  
    # use different df based on user input or default input
    if(!is.null(input$file)){
            df <- read.xlsx(input$file$datapath,sheet = 1)
            df = df[complete.cases(df),]
            df = df[,sapply(df, function(v) var(v, na.rm=TRUE)!=0)]   # remove constant column
            df_pca <- prcomp(df,center = TRUE,scale. = TRUE)
            g <- myggbiplot(df_pca,sample_ratio=inputPercentage,select_features=selected,alpha = input$alpha,
                            choices = inputChoices)
          }else{
            df = data(wine)
            df_pca = prcomp(wine,center = TRUE,scale. = TRUE)
            g <- myggbiplot(df_pca,sample_ratio = inputPercentage,select_features = selected, alpha= input$alpha,
                            groups = as.factor(wine$class), ellipse = TRUE,choices = inputChoices)
          }
    print(g)
    }
  )
  
  output$cols <- renderUI({
    if(!is.null(input$file)){
      df <- read.xlsx(input$file$datapath,sheet = 1)
      col_names <- names(df)
    }else{
      data(wine)
      col_names <- names(wine)
    }
    checkboxGroupInput("cols",label = h4("Pick Features"),col_names,inline = TRUE)
  })
  
  
})