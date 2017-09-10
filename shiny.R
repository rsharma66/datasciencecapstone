# =================================================
# : Coursera.org
# : Data Science Specialization - Capstone Project
# : September 2017
# :
# : Shiny Application: Predicting Next Word
# :
# : Author  - Rajiv Sharma
# : 
# =================================================

library(shiny)
source("letsdoit.R")

ui <- shinyUI(fluidPage(
titlePanel(title = "Predicting the Next Word App - Rajiv Sharma"),
sidebarLayout(
sidebarPanel(h4("Go on, say something!"),
textInput("value", "", "You are truly")

),
mainPanel(

tabsetPanel(

tabPanel(h4("Prediction"), textOutput("predicts")),
tabPanel(h4("System Time"), textOutput("msg")),
tabPanel(h4("Additional Info"), htmlOutput("inc"))
)
)

)
)
)

server <- shinyServer(function(input,output, session) {

observe({
    startTime <- Sys.time()

output$predicts <- renderText(PredictWords(input$value))
    endTime <- Sys.time()
    output$msg <- renderText(paste(round(10*(endTime-startTime), 2), "seconds", sep =" "))
    
    
})

getPage <- function() {
    return(includeHTML("info.html"))
    }
output$inc <- renderUI({getPage()})

})


shinyApp(ui = ui, server = server)
