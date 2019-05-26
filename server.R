#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(pracma)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$simMat <- renderTable({
    number1 <- input$obs1
   # number2 <- input$obs2
    trans <- input$caption
    city <- input$caption1
    accom <- input$caption2
    categ <- input$Category
    time <- input$Month
    # vari <- input$variable
    N_metrics <- matrix(c(accom, accom, accom, accom, accom
                          
                          , city, city, city, city, city,
                          trans, trans, trans, trans, trans,
                          number1, number1, number1, number1, number1,
                          time, time, time, time, time,
                          categ, categ, categ, categ, categ
                          
    ), ncol = 6)
    
    colnames(N_metrics) <- c("accomodation", "city","transport","number of people","month","category")
    row.names(N_metrics) <- c ("place1", "place2", "place3", "place4","place5")
    
    N_metrics
  }, rownames = TRUE)
  
  
  #reactive printing
  reactive_mat <- reactive({
    
    if(input$Category =="0"){
      #print(input$Category)
      output$mat <- renderTable({
        number1 <- input$obs1
        number2 <- input$obs2
        trans <- input$caption
        city <- input$caption1
        accom <- input$caption2
        
        # vari <- input$variable
        N_metrics <- matrix(c("mcdonalds","kfc", "do darya","dolmen","kababji", accom, accom, accom, accom, accom
                              
                              , city, city, city, city, city,
                              trans, trans, trans, trans, trans,
                              number1, number1, number1, number1, number1,
                              number2, number2, number2, number2, number2
                              
        ), ncol = 6)
        
        colnames(N_metrics) <- c("accomodation", "city","trans","a","b","c")
        row.names(N_metrics) <- c ("observation1", "observation2", "suggest3", "suggest4","s5")
        
        N_metrics
      }, rownames = TRUE)
    } #if ends
    
    else{
      output$mat <- renderTable({
        number1 <- input$obs1
        number2 <- input$obs2
        trans <- input$caption
        city <- input$caption1
        accom <- input$caption2
        #vari <- input$variable
        
        N_metrics <- matrix(c("place1","p2", "do darya","dolmen","kababji", accom, accom, accom, accom, accom
                              
                              , city, city, city, city, city,
                              trans, trans, trans, trans, trans,
                              number1, number1, number1, number1, number1,
                              number2, number2, number2, number2, number2
                              
        ), ncol = 6)
        
        colnames(N_metrics) <- c("accomodation", "city","trans","a","b","c")
        row.names(N_metrics) <- c ("observation1", "observation2", "suggest3", "suggest4","s5")
        
        N_metrics
      }, rownames = TRUE)
      
    }#else ends
    
  }
  ) #reactive ends.
  output$simMat1 <- renderTable({
    city <- input$time
    star <- input$budgeting
    N_metrics <- matrix(c("city","city","nature","nature", "historical",star, star, "3 star", "2 star", "3 star"
                          
                          , city, "Lahore", city, "Hunza", "Lahore",
                          "car", "car", "bus", "bus", "car",
                          
                          "pc hotel", "avari", "saravana", "wandering", "pc hotel"
                          
                          
    ), ncol = 5)
    
    colnames(N_metrics) <- c("category", "accomodation","City","transportation","hotel")
    row.names(N_metrics) <- c ("place1", "place2", "place6", "place8","place9")
    
    N_metrics
  }, rownames = TRUE)
  
  
  
})
  
