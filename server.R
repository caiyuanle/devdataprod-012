library(shiny)

shinyServer(function(input, output) {
    
    output$meanAndSDOutput <- renderUI({
        meanHeightValue <- round(mean(women$height), digits = 2)
        meanWeightValue <- round(mean(women$weight), digits = 2)        
        model <- lm(weight ~ height, data=women)
        pointXValue <- data.frame(height = as.integer(input$womanHeight))
        pointYValue <- round(predict(model, pointXValue), digits = 2)
        meanString <- paste("The mean of the women's height is <b>", 
                            meanHeightValue, "</b> inch, and the mean of the 
                            women's weight is <b>", 
                            meanWeightValue, "</b> lbs.")
        predictionString <- paste(
            "The predicted weight for the input height is <b>", 
            pointYValue, "</b> lbs.") 
        HTML(paste(meanString, predictionString, sep = '<br/>'))
    })
    
    output$plotOutput <- renderPlot({   
        meanHeightValue <- round(mean(women$height), digits = 2)
        meanWeightValue <- round(mean(women$weight), digits = 2)
        model <- lm(weight ~ height, data=women)
        pointXValue <- data.frame(height = as.integer(input$womanHeight))
        pointYValue <- round(predict(model, pointXValue), digits = 2)
        plot(model$model,xlim = c(80,260), ylim = c(50,100))
        abline(h = meanHeightValue, v = meanWeightValue, col = "blue")
        abline(h = pointXValue, v = pointYValue, col = "red")
    })
})

#library(shinyapps)
#shinyapps::deployApp('Assignment')