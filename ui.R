library(shiny)

shinyUI(fluidPage(
    
    titlePanel("Shiny Application for Developing Data Products course assignment"),
    
    sidebarLayout(
        sidebarPanel(
            h3("What does this app do?"),
            p("This app is built on top of the ", 
              span("women", style = "color:blue"),
              "dataset in R."),
            p("It builds a linear model from women's height to women's weight,
              takes the height of a woman as input, predicts the weight of 
              the woman based on the linear model, and outputs the prediction 
              value."),
            p("Moreover, it shows the plot to visualize the input height and 
              predicted weight, compared with the mean height and mean weight."),
            h3("How to use this app?"),
            p("Simply enter a number between 50 and 100 in the textbox below, and 
              press ",
              span("Predict Weight", style = "color:blue"),
              "button or press ",
              span("Enter", style = "color:blue"),
              "key. The output will be dynamically updated in the main panel
              on the right. "),
            textInput("womanHeight", label = "Please input the woman's height 
                      here (inch)", value = "60"),
            submitButton("Predict Weight")
        ),
        
        mainPanel(
            h3("Here is the output value:"),
            htmlOutput("meanAndSDOutput"),
            h3("Here is the output plot:"),
            p("The horizontal blue line shows the mean of the women's height, and
              the vertical blue line shows the mean of the women's weight."), 
            p("The horizontal red line shows the input height, and the vertical 
              red line shows predicted weight based on the input height, using
              the linear model built from the women dataset."), 
            p("If the input value is not in the range [50, 100], the plot 
              will not show the red lines."), 
            plotOutput("plotOutput")
        )
    )
))

#library(shinyapps)
#shinyapps::deployApp('Assignment')