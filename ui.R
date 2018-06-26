library(shiny, quietly = TRUE)
library(ggplot2, quietly = TRUE)

datasets::mtcars
# Define UI for application that plots features of movies
ui <- fluidPage(
    titlePanel("Regression Analysis", h3('mtcar')),
    
    # Sidebar layout with a input and output definitions
    sidebarLayout(
        
        # Inputs
        sidebarPanel(
            
            # Select Response
            selectInput(inputId = "res", 
                        label = "Select Response (Y-axis):", 
                        choices = names(mtcars)),

            # Select Predictor
            selectInput(inputId = "pred", 
                        label = "Select Predictor (X-axis):", 
                        choices = names(mtcars)),
            
            # Check if lm required
            checkboxInput(inputId = 'lm', 
                          label = 'Show linear regression?', value = TRUE 
                        )
       
        ),
        
        # Output:
        mainPanel(
                    
            h5('The following scatterplot uses the "mtcar" dataset. This plot is 
               used to investigate the linear relationship of any two of the car 
               features. This plot also shows the confident interval of the predicted response.'),
            
            plotOutput(outputId = "scatter")
                  
        )
    )
)

# Define server function required to create the scatterplot
