library(shiny) 
library(ggplot2)
library(tidyverse)
library(readxl)
library(plotly)


#zhiyi_tiku  <- read_excel("data/执医题库.xlsx")

#######考纲可视化数据加载############################ 

kg_data <- read_excel("data/kg_data.xlsx")
kg_data <- kg_data %>% mutate(总 = as.numeric(总) + 0.01) 

kg_data <- kg_data %>%
  #slice(1:100) %>%
  rowwise() %>%
  mutate(四级目录名称 = str_glue(三级目录名称,四级目录名称,.sep = "-")) 


kg_4 <- kg_data %>%
  select(三级目录名称,四级目录名称,总) %>%
  group_by(四级目录名称,三级目录名称) %>%
  summarise(总 = sum(总))

kg_3 <- kg_data %>%
  select(二级目录名称,三级目录名称,总) %>%
  group_by(三级目录名称,二级目录名称) %>%
  summarise(总 = sum(总))

kg_2 <- kg_data %>%
  select(二级目录名称,总) %>%
  group_by(二级目录名称) %>%
  summarise(总 = sum(总))

#######考纲可视化数据加载############################

shinyServer(function(input, output) { 

  
    
  
    output$data <- renderText({
      
      paste(
        round(
         ( 1 / (1 + exp( - (1.865 * input$complete/100 + 8.78 * (input$correct/100 +  (1 - input$complete/100) ) - 6.324))) ) * 100
          ,digits = 2
        ),
        "%"
      )
      
  })
    
    output$data2 <- renderText({
      
      paste(
      round(
         (  1 / (1 + exp( - (1.865 * input$complete/100 + 8.78 * (input$correct/100 - (1 - input$complete/100) * 0.5) - 6.324)))) * 100
          ,digits = 2),
      "%"
      )
    })
    output$data3 <- renderText({
      paste(
      round(
       ( ( 1 / (1 + exp( - (1.865 * input$complete/100 + 8.78 * (input$correct/100 +  (1 - input$complete/100) * 0.8)  - 6.324))) ) * 100 +  
           (  1 / (1 + exp( - (1.865 * input$complete/100 + 8.78 * (input$correct/100 - (1 - input$complete/100) * 0.3) - 6.324)))) * 100) /2 ,
            digits = 2) ,
      "%"
      )
    })
    
    output$data4 <- renderText({
      paste(
        round(
          (
            (
              ( 1 / 
                  (1 + exp( - (1.865 * input$complete/100 + 8.78 * (input$correct/100 +  (1 - input$complete/100) * 0.8)  - 6.324)
                            )
                   ) 
                ) * 100 +
               (  1 / 
                    (1 + exp( - (1.865 * input$complete/100 + 8.78 * (input$correct/100 - (1 - input$complete/100) * 0.3) - 6.324)
                            )
                     )
                ) * 100
              )  
          ) * 
            (1 / (1 + exp(-20 * input$complete/100) ) - 0.5) * 1 ,
          digits = 2) ,
        "%"
      )
    })
    
    # predict <- round((input$quiz_correct/100 * 0.33128 + 0.36739) * 600,digits = 2)
    #high <- round((input$quiz_correct/100  * (0.33128 + 0.04755) + 0.36739) * 600,digits = 2)
    #low <- round((input$quiz_correct/100  * (0.33128 - 0.04755) + 0.36739) * 600,digits = 2)
    
    output$data5 <- renderText({
      #  考试正确率 = 0.33128 * 正确率 + 0.36739 , se = 0.04755
      paste(
      "您的总分预估为:",
      round((input$quiz_correct/100 * 0.33128 + 0.36739) * 600,digits = 2),
      ",",
      "您目前复习水平对应的分数区间为：",
      round(((input$quiz_correct/100 - 0.04755) * 0.33128 + 0.36739) * 600,digits = 2),
      "到",
      round(((input$quiz_correct/100 + 0.04755) * 0.33128 + 0.36739) * 600,digits = 2),
      "。",
      paste(
        if(round(((input$quiz_correct/100 + 0.04755) * 0.33128 + 0.36739) * 600,digits = 2) < 360){
          "您目前的预测通过率较低，下次努力将正确率提高到70%以上哦！"
        }else if(
          (round(((input$quiz_correct/100 + 0.04755) * 0.33128 + 0.36739) * 600,digits = 2) > 360) *
          (round(((input$quiz_correct/100 - 0.04755) * 0.33128 + 0.36739) * 600,digits = 2) <= 360)
        ){
          "您目前的预测通过率处于中等水平，下次努力将正确率提高到75%以上的稳过水平哦！"
        }else{
          "您目前的预测通过率很高，请继续保持，争取冲刺更高分数哦！"
        }
      ),
      "注：本套试卷严格按照执业医师各学科比例随机抽取题目，能够较为准确地反映您的复习情况。下图为您的预测成绩在2021年5000名考生中的分布位置。"
      )
    })
    
    
    data = data.frame(a = rnorm(n = 1000,mean = 360,sd = 45))
    
    output$plot5 <- renderPlot({
      ggplot(data,aes(x = a)) + 
        #geom_histogram(mapping = aes(a),fill = "#ADA4E9",color = "#8D7FE9",alpha = 0.8) + 
        geom_density(fill = "#ADA4E9",color = "#8D7FE9",alpha = 0.5)+ 
        geom_vline(xintercept = 360, color = "black",alpha = 0.3) + 
        geom_vline(xintercept = round((input$quiz_correct/100 * 0.33128 + 0.36739) * 600,digits = 2),color = "#5E4AE8",size = 2,alpha = 0.7) + 
        xlab("笔试分数") + 
        ylab("占比分布") + 
        geom_text(mapping = aes(
          size = 60,
          x = 360,
          y = 0,
          label = "360"
          
        )) + 
        geom_text(mapping = aes(
          size = 60,
          x = round((input$quiz_correct/100 * 0.33128 + 0.36739) * 600,digits = 2),
          y = 0.005,
          label = "你的预估分数"
         
        )) + 
        geom_text(mapping = aes(
          size = 60,
          x = round((input$quiz_correct/100 * 0.33128 + 0.36739) * 600,digits = 2),
          y = 0.0045,
          label = round((input$quiz_correct/100 * 0.33128 + 0.36739) * 600,digits = 2)
          
        )) +
        theme(text = element_text(size = 20)) 
        
        
    })
    
    
    #####轻量级试卷预测模型试验@李浩@产品########
   p3 = -0.547
   p2 = 0.2857
   p1 = 1.4632
   inter = -0.3715
   err = 0.08
   
   pred <-  reactive({(input$quiz_correct_2 / 100)^3 * p3 + 
                     (input$quiz_correct_2 / 100)^2 * p2 + 
                     (input$quiz_correct_2 / 100)^1 * p1 + inter})
   
   pred_upper_temp <- reactive({(input$quiz_correct_2 / 100)^3 * p3  + 
                           (input$quiz_correct_2 / 100 + err)^2 * p2 + 
                           (input$quiz_correct_2 / 100)^1 * p1 + inter})
   
   pred_lower_temp <- reactive({(input$quiz_correct_2 / 100)^3 * p3 + 
                           (input$quiz_correct_2 / 100 - err)^2 * p2 + 
                           (input$quiz_correct_2 / 100)^1 * p1  + inter})
   
   pred_upper <- reactive({
     ifelse(pred_upper_temp()>0,yes = pred_upper_temp(),no = 0 )
   })
   
   pred_lower <- reactive({
     ifelse(pred_lower_temp()>0,yes = pred_lower_temp(),no = 0 )
   })
   
   pred_cor <- reactive({
     ifelse( pred()>0,yes =  pred(),no = 0)
   })
   
   pred_score_zhiye <- reactive({
      round(pred_cor() * 600,digits = 0)
   })
   
   pred_score_zhuli <- reactive({
     round(pred_cor() * 300,digits = 0)
   })
   
   pred_score_zhiye_upper <- reactive({
     round(pred_upper() * 600,digits = 0)
   })
   
   pred_score_zhiye_lower <- reactive({
     round(pred_lower() * 600,digits = 0)
   })
   
   pred_score_zhuli_upper <- reactive({
     round(pred_upper() * 300,digits = 0)
   })
   
   pred_score_zhuli_lower <- reactive({
     round(pred_lower() * 300,digits = 0)
   })
   
   
   output$data6 <- renderText({
     paste(
     str_glue("执业医师成绩预测：",pred_score_zhiye(),"[",pred_score_zhiye_lower(),",",pred_score_zhiye_upper(),"]") ,

     str_glue("助理医师成绩预测：",pred_score_zhuli(),"[",pred_score_zhuli_lower(),",",pred_score_zhuli_upper(),"]")
     )

     })
  
   
     # 
   # ,"[",pred_score_zhuli_lower(),pred_score_zhuli_upper(),"]"
  

   
   ##### ##### ##### #####题目筛选######## ##### ##### #####
   
   
#
   
   # type_bool <- reactive({
   #   ifelse(input$ti_type == "执业医师",yes = 1,no = 0)
   # })
   #  
   # fenlei_id <- reactive({
   #   c(str_split(input$ti_select,pattern = ",",simplify = TRUE))
   # })
   # 
  
   # output$ti_selected <- renderText({
   #   # #paste(fenlei_id(),collapse = "")
   #   # #ifelse(type_bool() == 1,"执业医师","助理医师")
   #   # ifelse(type_bool== 1,
   #   #        yes = paste(ti%>%
   #   #          mutate(rand = rnorm(nrow(ti),0,1)) %>%
   #   #          filter(分类号 %in% fenlei_id() ) %>%
   #   #          filter(题型 == "A1" | 题型 == "A2") %>%
   #   #          arrange(rand) %>%
   #   #          arrange(desc(年份)) %>%
   #   #          mutate(si = row_number()) %>%
   #   #          filter(si <= 30) %>%
   #   #          select(题干id),collapse = ","),
   #   #        no = "助理医师"
   #   #            )
   #   # 
   #   # 
   #   # 
   # })
   #######考纲可视化############################ 
   
   
   
   
   
   #######考纲可视化############################
   
   output$kg_vis <- renderPlotly(
     plot_ly(
       labels =  kg_data$五级六级目录名称 %>% append(kg_4$四级目录名称) %>% append(kg_3$三级目录名称) , 
       parents = kg_data$四级目录名称     %>% append(kg_4$三级目录名称) %>% append(rep("执业医师",length(kg_3$三级目录名称))) ,
       values =  kg_data$总               %>% append(kg_4$总)           %>% append(kg_3$总)           ,
       type = "sunburst",
       height = 800,
       width = 800
     ) 
   )
   
   output$kg_vis_text <- renderText(
     "待完善"
   )

   #######考纲计算器############################
   
   output$time_consume <- renderText(103 * input$kg_1_complete + 
                                    267 * input$kg_2_complete + 
                                  216  * input$kg_3_complete + 
                                  70  * input$kg_4_complete)
   
   output$score_obtain <- renderText(
            103 * input$kg_1_complete * input$kg_1_correct + 
            267 * input$kg_2_complete * input$kg_2_correct + 
            216 * input$kg_3_complete * input$kg_3_correct + 
            70  * input$kg_4_complete * input$kg_4_correct  
   )
    
   
   #######考纲计算器############################
   
   
   #######实验室############################

   output$实验室_table1 <- renderDataTable({
     iris
   })
   
   

   # output$实验室_table2 <- renderDataTable({
   #   zhiyi_tiku
   # })
   
   output$plotly_1 <- renderPlotly(
     ggplotly(ggplot(iris) + geom_point(aes(x = Sepal.Length,y = Sepal.Width)))
     )

   output$plotly_2 <- renderPlotly(
     plot_ly(z = ~ volcano)  %>% add_surface() 
   )
   
   #######实验室############################ 
    })



  
  




