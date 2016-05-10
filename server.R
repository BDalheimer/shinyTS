library(shiny)

shinyServer(function(input, output, session) {

  output$formula = renderText(paste( "Call: y =", input$intercept, "+", input$root, "y_{t-1}", "+", "epsilon", sep = ""))
# AR model
  
  ARmodel = reactive({
    
    y = rep(0,length(input$times))
    
    if(input$order == 1){
      for (i in 1:input$times){
        
        y[i+1] = input$intercept + input$root * y[i]  + rnorm(1)
      }
    }
    if(input$order == 2){
      for(i in 1:input$times){
        
        y[i + 2] = input$intercept + input$root * y[i] + input$root * y[i + 1]  + rnorm(1)
        
      }
      y[1] = 0
      y[2] = input$intercept + input$root * y[1]  + rnorm(1)}
  
  y
  })
  
  output$ARplot = renderPlot({
    plot(1:input$times, ARmodel()[1:input$times], type = "l", main = "AR(1) Process", xlab = "Time", ylab = "y" )  
  })
  
  #MA model
  
  MAmodel = reactive({
    y = rnorm(input$MAtimes)
    v = input$MAintercept
    for(i in 1:100){
      
      if(i <= input$MAorder){
        y[i] = v + mean(y[1:i])
      }else{
        
        y[i] = v + mean(y[i-input$MAorder:i])
      }
    }
    y
  })
  
  output$MAplot = renderPlot({
    
    plot(1:input$MAtimes, MAmodel()[1:input$MAtimes], type = "l")
  })
  })