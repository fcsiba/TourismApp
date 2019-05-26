library(shiny)
library(shinyWidgets)
shinyUI<-navbarPage("Tourism Recommendation System",
                    
                    tabPanel("Dont know where to go? Click here!",
                             setBackgroundImage(src = "image2.jpg"),
                             
                             selectInput("time", "season:",
                                         c("January" = "Hunza",
                                           "February" = "Lahore",
                                           "March" = "Islamabad",
                                           "April" = "Hyderabad",
                                           "May" = "Hyderabad",
                                           "June" = "Kaghan",
                                           "July" = "Naran",
                                           "August" = "Kaghan",
                                           "september" = "Sargodha",
                                           "october" = "Gilgit",
                                           "november" = "Karachi",
                                           "December" = "Karachi"
                                         )),
                             selectInput("budgeting", "Enter budget range",
                                         c("<10,000" = "1star",
                                           "10,000-20,000" = "3star",
                                           "20,000-50,000" = "5star"
                                           
                                         )),
                             submitButton("Update View", icon("refresh")),
                             h1("Our recommendations: "),
                             tableOutput("simMat1")
                             
                    ),
                    
          tabPanel("Have Preferences? Click here!",
                   #setBackgroundImage(src = "image1.jpg"),
                 
                   #setBackgroundImage(src = "image1.jpg"),
                    numericInput("obs1", value = 2, min = 1, max = 4, label = "number of people"),
                   # numericInput("obs2", value = 2, min = 1, max = 4, label = "n2"),
                   selectInput("budget", "Enter budget range",
                               c("<10,000" = "jan",
                                 "10,000-20,000" = "feb",
                                 "20,000-50,000" = "march"
                                 
                               )),
                   selectInput("Month", "season:",
                               c("January" = "jan",
                                 "February" = "feb",
                                 "March" = "march",
                                 "April" = "april",
                                 "May" = "may",
                                 "June" = "june",
                                 "July" = "july",
                                 "August" = "august",
                                 "september" = "september",
                                 "october" = "october",
                                 "november" = "november",
                                 "December" = "december"
                               )),
  
                    selectInput("Category", "category:",
                      c("Historical" = 0,
                        "City" = 1,
                         "Active" = 2,
                          "Adventure" = 3
                         )),
                    textInput("caption", "Transport", "car"),
                    
                    textInput("caption1", "city", "karachi"),
                    
                    textInput("caption2", "accomodation", "5star"),
                    
                    submitButton("Update View", icon("refresh")),
                                                
                    #verbatimTextOutput("value")
                    verbatimTextOutput("value1"),
                    #verbatimTextOutput("value2")
                   h1("Our recommendations: "),
                      tableOutput("simMat")
                    
                
          )
          
          )
          
 