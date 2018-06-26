library(shiny, quietly = TRUE)
library(ggplot2, quietly = TRUE)

server <- function(input, output, session) {
    
    # Create scatterplot object the plotOutput function is expecting 
    output$scatter <- renderPlot({
        gg <- ggplot(mtcars, aes_string(x = input$pred, y = input$res)) + 
            geom_point() +  
            xlab("Predictor") +
            ylab("Response") +
            theme(legend.title = element_blank(),
                  axis.title.x = element_text(face="bold", size=15),
                  axis.text.x  = element_text(vjust=0.5, size=15),
                  axis.title.y = element_text(face="bold", size=15),
                  axis.text.y  = element_text(vjust=0.5, size=15))  
        if (input$lm == TRUE){ gg <- gg + geom_smooth(method = 'lm')}
        gg
    })
    
    
    
}

