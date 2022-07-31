library(shiny)
library(shinythemes)
library(plotly)

ui <- navbarPage("丁香医考实验室",
#########预测模型(复习建议)#########################################################
           tabPanel("预测模型(复习建议)",
                    ##style##
                    tags$image(
                      width = 200,
                      src = "logo.png"),
                    tags$br(),tags$br(),
                    tags$hr(),
                    ##style##
                    sliderInput("complete", "题库完成率",
                                min = 0, max = 100, step = 1,value = 0),
                    sliderInput("correct","题库正确率",
                                min = 0,max = 100,step = 1,value = 0),
                    p("预测的通过率(高)"),
                    textOutput("data"),
                    p(),
                    p("预测的通过率(低)"),
                    textOutput("data2"),
                    p(),
                    p("最终预测值(李浩)"),
                    textOutput("data3"),
                    p(),
                    p("最终预测值(浩托)"),
                    textOutput("data4")
                    
                    
                    ),
#########预测模型(课程顾问)#########################################################
           tabPanel("预测模型(课程顾问)",
                    ##style##
                    tags$image(
                      width = 200,
                      src = "logo.png"),
                    tags$br(),tags$br(),
                    tags$hr(),
                    ##style##
                    sliderInput("quiz_correct", "测试卷正确率",
                                min = 20, max = 100, step = 1,value = 20),
                    
                    p("您本套测试卷的分析报告如下："),
                    textOutput("data5"),
                    plotOutput("plot5",
                               height = "500px",
                               width = "650px")),
#########预测模型(轻量试卷)#########################################################          
           tabPanel("预测模型(轻量试卷)",
                    ##style##
                    tags$image(
                      width = 200,
                      src = "logo.png"),
                    tags$br(),tags$br(),
                    tags$hr(),
                    ##style##
                    sliderInput("quiz_correct_2", "测试卷正确率",
                                min = 0, max = 100, step = 1,value = 20),
                    textOutput("data6")),
           
#########题目筛选(施工中)#########################################################         
            tabPanel("题目筛选(施工中)",
                     ##style##
                     tags$image(
                       width = 200,
                       src = "logo.png"),
                     tags$br(),tags$br(),
                     tags$hr(),
                     ##style##
                    #,
                    # textAreaInput("ti_select","分类号", width = "400px"),
                    # "输入分类号，以英文逗号隔开",
                    # p(" "),
                    # p(" "),
                    # p(" "),
                    # selectInput(inputId = "ti_type",
                    #             label = "题库类型",
                    #             choices = c("执业医师","助理医师")),
                    # submitButton("生成题目ID", icon("refresh")),
                    # textOutput("ti_selected")
                    ),

#########考纲可视化#########################################################         
tabPanel("考纲可视化",
         ##style##
         tags$image(
           width = 200,
           src = "logo.png"),
         tags$br(),tags$br(),
         tags$hr(),
         ##style##
         
         tabsetPanel(
           id = "kg_vis_tab",
           tabPanel("执业医师",plotlyOutput("kg_vis")),
           tabPanel("助理医师",textOutput("kg_vis_text"))
          
         )
         
),



#########考纲计算器#########################################################         
tabPanel("考纲计算器",
         ##style##
         tags$image(
           width = 200,
           src = "logo.png"),
         tags$br(),tags$br(),
         tags$hr(),
         ##style##
         
         fluidRow(
           column(width = 4,sliderInput("kg_1_complete", "第一梯队考点完成率",
                                        min = 0, max = 1, step = 0.01,value = 0)),
           column(width = 4,sliderInput("kg_1_correct", "第一梯队考点正确率",
                                        min = 0, max = 1, step = 0.01,value = 0))),
         
         fluidRow(
           column(width = 4,sliderInput("kg_2_complete", "第二梯队考点完成率",
                                        min = 0, max = 1, step = 0.01,value = 0)),
           column(width = 4,sliderInput("kg_2_correct", "第二梯队考点正确率",
                                        min = 0, max = 1, step = 0.01,value = 0))),
         
         fluidRow(
           column(width = 4,sliderInput("kg_3_complete", "第三梯队考点完成率",
                                        min = 0, max = 1, step = 0.01,value = 0)),
           column(width = 4,sliderInput("kg_3_correct", "第三梯队考点正确率",
                                        min = 0, max = 1, step = 0.01,value = 0))),
         
         fluidRow(
           column(width = 4,sliderInput("kg_4_complete", "第四梯队考点完成率",
                                        min = 0, max = 1, step = 0.01,value = 0)),
           column(width = 4,sliderInput("kg_4_correct", "第四梯队考点正确率",
                                        min = 0, max = 1, step = 0.01,value = 0))),
         

         p("预计花费时间："),
         textOutput("time_consume"),
         p("预计得分：") ,
         textOutput("score_obtain")
         
),
#########实验室#########################################################    
           tabPanel("实验室",
                    ##style##
                    tags$image(
                      width = 200,
                      src = "logo.png"),
                    tags$br(),tags$br(),
                    tags$hr(),
                     ##style##
                  
                    tabsetPanel(
                      id = "dataset",
                      tabPanel("数据集1",dataTableOutput("实验室_table1")),
                      #tabPanel("数据集2",dataTableOutput("实验室_table2")),
                      tabPanel("绘图1", plotlyOutput("plotly_1")),
                      tabPanel("绘图2", plotlyOutput("plotly_2")),
                    )
                  
                   )
#########以下区域勿动#########################################################            
            )
shinyUI(ui)
######################################UI函数###############
# ui <- fluidPage(
#   titlePanel("丁香医考预测模型（内部评估使用）@李浩"),
#   p("------------------------产品开发使用------------------------"),
#   
#   sliderInput("complete", "题库完成率",
#               min = 0, max = 100, step = 1,value = 0),
#   sliderInput("correct","题库正确率",
#               min = 0,max = 100,step = 1,value = 0),
#   p("预测的通过率(高)"),
#   textOutput("data"),
#   p(),
#   p("预测的通过率(低)"),
#   textOutput("data2"),
#   p(),
#   p("最终预测值(李浩)"),
#   textOutput("data3"),
#   p(),
#   p("最终预测值(浩托)"),
#   textOutput("data4"),
#   
#   
#   p("------------------------课程顾问使用@丽玲------------------------"),
#   sliderInput("quiz_correct", "测试卷正确率",
#               min = 20, max = 100, step = 1,value = 20),
#   
#   p("您本套测试卷的分析报告如下："),
#   textOutput("data5"),
#   plotOutput("plot5",
#              height = "500px",
#              width = "650px"),
# 
#   
#   
#   p("------------------------轻量级试卷预测模型试验@李浩@产品------------------------"),
#   sliderInput("quiz_correct_2", "测试卷正确率",
#               min = 0, max = 100, step = 1,value = 20),
#   
#   textOutput("data6")
#   
#   
#   
#   )
#   
# 
# shinyUI(ui)
##########The end#########################

