library(shiny)

shinyUI(
  
  navbarPage("Time Series Simulator",
             tabPanel(title ="AR Processes",
                      sidebarLayout(position = "right",
                      
                                    mainPanel(width = 9,
                      
                                fluidPage( fluidRow(textOutput("formula")),
                                 fluidRow(plotOutput("ARplot", width ="100%")),
                                 fluidRow(actionButton("save", "Save Time Series")    
                                          ))),
                      
                      sidebarPanel(width = 3, h3("Parameters"),
                      
                      sliderInput("order", "Order", sep="", value = 1, min = 1, max = 3),                          
                      
                      numericInput("intercept", "Intercept", value = 0),
                      
                      sliderInput("root", "Root", sep = "", 
                                  value = 0, min = -1, max = 1, step = 0.01),
                      
                      numericInput("times", "T", value = 100, max = 10000),
                      
                      radioButtons("trend", "Trend", choices = c("No", "Yes"))
                      
                      )
                      )
                      ),
             tabPanel("MA Processes",
                      sidebarLayout(position = "right",
                                    
                                    mainPanel(width = 9,
                                              
                                              fluidPage( fluidRow(),
                                                         fluidRow(plotOutput("MAplot", width ="100%")),
                                                         fluidRow()    
                                                         )),
                                    
                                    sidebarPanel(width = 3, h3("Parameters"),
                                                 
                                                 sliderInput("MAorder", "Order", sep="", value = 1, min = 1, max = 100),                          
                                                 numericInput("MAintercept", "Intercept", value = 0),
                                                 numericInput("MAtimes", "T", value = 100, max = 10000)
#                                                  numericInput("intercept", "Intercept", value = 0),
#                                                  
#                                                  sliderInput("root", "Root", sep = "", 
#                                                              value = 0, min = -1, max = 1, step = 0.01),
#                                                  
#                                                  numericInput("times", "T", value = 100, max = 10000),
#                                                  
#                                                  radioButtons("trend", "Trend", choices = c("No", "Yes"))
                                                 
                                    )
                      )
                      
                      
                      ),  
                      
                      
                      
             tabPanel("Tests", h3("Under Construction")),
             tabPanel("Monte Carlo Experimenting", h3("Under Construction")))
                        
                      
)