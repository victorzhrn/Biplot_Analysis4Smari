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
            df = (wine)
            if(!is.null(input$features_for_pca)){
              df = df[,colnames(df) %in% (input$features_for_pca)]
            }
            df_pca = prcomp(df,center = TRUE,scale. = TRUE)
            g <- myggbiplot(df_pca,sample_ratio = inputPercentage,select_features = selected, alpha= input$alpha,
                            groups = as.factor(wine$class), ellipse = TRUE,choices = inputChoices)+ggtitle(input$plot_title)
          }
    print(g)
    }
  )
  
  output$cols <- renderUI({
#     if(!is.null(input$file)){
#       df <- read.xlsx(input$file$datapath,sheet = 1)
#       col_names <- names(df)
#     }else{
#       data(wine)
#       col_names <- names(wine)
#     }
    col_names = input$features_for_pca
    checkboxGroupInput("cols",label = h4("Pick features to display"),col_names,inline = TRUE,selected = col_names)
  })
  
  output$features <- renderUI({
    if(!is.null(input$file)){
      df <- read.xlsx(input$file$datapath,sheet = 1)
      col_names <- names(df)
    }else{
      df = (wine)
      col_names <- names(df)
      checkboxGroupInput("features_for_pca",label = h4("Pick features for PCA analysis"),col_names,inline = TRUE,selected = col_names)
    }
  })
  
  
})