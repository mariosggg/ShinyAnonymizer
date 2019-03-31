library(shiny)
library(dplyr)
library(plotly)
ui <- fluidPage(
  
  titlePanel("ShinyCrypt"),
  
  sidebarLayout(
    sidebarPanel( 
      selectInput("data", label = "Loaded Data",
                  choices = c("PatientCorePopulatedTable")),
      
      selectInput("select", "Select columns to display", names(PatientCorePopulatedTable), multiple = 
                    TRUE),
     
      # show the  encrypted  input of data table
      
  
      checkboxGroupInput("Encryption", "Selected Encrypted Algorithm:",
                         c("DES" = "PatientGender",
                           "XDES" = "PatientRace",
                           "Blowfish" = "PatientMaritalStatus",
                           "AES512" = "PatientLanguage"
              
                           
                         )),
      
      checkboxGroupInput("Hashing", "Selected Hashing  Algorithm:",
                         c("MD5" = "PatientGender",
                           "SHA512" = "PatientRace",
                           "CRC32" = "PatientMaritalStatus",
                           "XXHASH64" = "PatientLanguage"
                           
                           
                         )),
     
      checkboxGroupInput("Anonymizing", "Selected Anonymizing  Algorithm:",
                         c("Suppression" = "PatientRace",
                           "Removing Informations"="PatientGender",
                           "Generalization"="PatientMaritalStatus",
                           "bottom Coding"="PatientLanguage"
                           
                         ))
      
      
    

      
    ),
   
    
    # Show a plot of the generated distribution
    mainPanel(height = 2,
      tabsetPanel(
        tabPanel("Loaded Data",
          
                 dataTableOutput('mytable')
                 
            
              
                 
          
          
        ),
        
        tabPanel("Encrypted Data",
                 
                 tableOutput("data")
                 
        ),
        tabPanel("Hashed Data",
                 
                 tableOutput("data1")
            
                 
                 
        ),
        tabPanel("Anonymized Data",
                 
                 tableOutput("data2")
                 
                 
        ),
        tabPanel("Visualize the Data",
                 h3("Patients by ID and MaritalStatus",align="center"),
                 p <- plot_ly(PatientCorePopulatedTable, x = ~PatientID, color = ~PatientMaritalStatus, type = "box",height = 200),
                 h3("Patients by Race",align="center"),
                 p<-plot_ly(PatientCorePopulatedTable, x = ~PatientRace,height = 200),
                 h3("Patients by PatientGender and PatientLanguage",align="center"),
                 p <- plot_ly(PatientCorePopulatedTable, x = ~PatientGender,y=~PatientLanguage,height = 200)

                
                 
                 
                 
        ),
        tabPanel("Summary Statistics",
                 
                 
                 verbatimTextOutput("summary")
                 
        )
      )

    )
  )
)

server <- function(input, output) {
  
  data <- reactive({ get(input$data) })
  
  output$mytable = renderDataTable({
    columns = names(PatientCorePopulatedTable)
    if (!is.null(input$select)) {
      columns = input$select
    }
    PatientCorePopulatedTable[,columns,drop=FALSE]
  })
 
  
  output$data <- renderTable({
    Encrypted[, c("PatientID", input$Encryption), drop = FALSE]
  }, rownames = TRUE)
  

  

  output$data1 <- renderTable({
    Hashed[, c("PatientID", input$Hashing), drop = FALSE]
  }, rownames = TRUE)
  
  
  
  
  output$data2 <- renderTable({
    Anonymized[, c("PatientID", input$Anonymizing), drop = FALSE]
  }, rownames = TRUE)
  
  output$summary <- renderPrint({
    
    summary(PatientCorePopulatedTable)
  })
  
 
  
  
  
 
}

shinyApp(ui, server)