#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

server <- function(input, output, session) {

}

ui <- fluidPage(

    fluidRow(
        column(6, offset=1,
               h1("Title in one row")
        )

    ),
    fluidRow(
        column(1,
               actionButton("button", "Click")

        ),
        column(6,
               p("Row 2, Column 2 (button is col 1)")
        )

    )
)

shinyApp(ui = ui, server = server)
