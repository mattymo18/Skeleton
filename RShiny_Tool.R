#This is an RShiny Skeleton
############################## Enviornment ##############################
library(shiny)
library(shinythemes)
library(tidyverse)

#Important for command line use in Makefile
args <- commandArgs(trailingOnly = T)
port <- as.numeric(args[[1]])

#Load in data
Data1 <- read.csv("source_data/Data1.csv")

############################## User Interface ##############################
#find theme in shinytheme documentation
#this is for a navbar with sidebar layout, a common layout

ui <- fluidPage(theme = shinytheme("Theme"),
                navbarPage("Title",
                           tabPanel("Subtitle", 
                                    sidebarLayout(
                                      sidebarPanel(),
                                      mainPanel()
                                    )
                                    
                           )
                )
)

############################## Server ##############################
#Empty server

server <- function(input, output, session) {}

############################## Running the App ##############################
#Run Shiny App

shinyApp(ui = ui, server = server, options = list(port=port,
                                                  host="0.0.0.0"))