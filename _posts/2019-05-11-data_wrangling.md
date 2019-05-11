---
layout: post
title: Data wrangling with R for speech science
subtitle: Juqiang CHEN | MARCS Institute for Brain, Behavior and Development
tags: [R, Data science, Speech science, Workshop]
---


# Data wrangling for speech scientists with R
Juqiang Chen  
10/05/2019   


******
![]((/img/blog_images/figure-html/cover.jpg) 

<!--html_preserve--><div id="htmlwidget-0aeb8f13c2f691fc7c71" style="width:672px;height:672px;" class="grViz html-widget"></div>
<script type="application/json" data-for="htmlwidget-0aeb8f13c2f691fc7c71">{"x":{"diagram":"\ndigraph data_wrangling_workflow {\n\n  # a \"graph\" statement\n  graph [overlap = true, fontsize = 10, rankdir = LR]\n\n  # several \"node\" statements\n  node [shape = box,\n        style = filled,\n        fontname = Helvetica]\n  Import; Tidy; Transform; Visualize; Model; Communicate\n  # several \"edge\" statements\nImport -> Tidy->Transform\nTransform -> Visualize \nTransform -> Model\n#Communicate -> Model\n#Communicate -> Visualize\nModel -> Communicate[dir = both]\nVisualize -> Communicate [dir = both]\n}\n","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

Data Analysis workflow (by Hadley Wickham)

******

# What is data wrangling?

<!--html_preserve--><div id="htmlwidget-31e07fec8f6a68c48e56" style="width:672px;height:480px;" class="grViz html-widget"></div>
<script type="application/json" data-for="htmlwidget-31e07fec8f6a68c48e56">{"x":{"diagram":"digraph {\n  # a \"graph\" statement\n  graph [overlap = true, fontsize = 10, rankdir = LR]\n\n  # several \"node\" statements\n  node [shape = box,\n        style = filled,\n        fontname = Helvetica]\n  Import; Tidy; Transform; Visualize; Model; Communicate\n\n  # several \"edge\" statements\n  subgraph cluster1 {\n  node [style=filled,color=white];\n  style=filled;\n  color=lightgrey;\n  Import -> Tidy->Transform;\n  label = \"Data_wrangling\"\n    }\n\nTransform -> Visualize \nTransform -> Model\nModel -> Communicate[dir = both]\nVisualize -> Communicate [dir = both]\n\n}","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

******

## Import your data

### Common data format in speech perception experiments
  + csv
    - read_csv("filename"): comma delimited files
    - read_csv2("filename"): semi-colon delimited files
  + other delimiter
    - read_delim("file.txt", delim = "|")
    

```r
#import data
chinese <- read.delim("chinese.txt", na = "NA")

vietnamese <- read.delim("vietnamese.txt")

#glimpse your data
#glimpse(chinese)
#summary(chinese)
```

******

![What you expect to see](/img/blog_images/figure-html/image2.jpg) ![What life is like](/img/blog_images/figure-html/image1.jpg) 


******

## Tidy your data!

### Subset variables (columns)
 + dplyr::select(data, col1, col2, col3)
  - select(data, contains("_"))
  - select(data, end_with("x"))
  - select(data, matches("ab"))
  - select(data, num_range("x", 1:6))
  - select(data, start_with("bv"))
  - select(data, col2:col4)
  - select(data, -col3)
  
### Subset observations (row)
 + dplyr::filter(data, condition)
  - filter(data, col1 > 0)
  - filter(data, col2 !is.na)
  - filter(data, col2 != NA)

+ dplyr::disinct(data)
+ dplyr::sample_frac(data, 0.5, replace = TRUE)
+ dplyr::sample_n(data, 10, replace = TRUE)

******

## It's time to get our hands dirty!
+ Challenge 1: remove practice session from the data.
+ Challenge 2: remove missing value in "insex1.RESP"
+ Challenge 3: select some variables:"Subject","tone.Trial.", "insex1.RESP", "insex1.RT", "exprate.RESP","exprate.RT", "Procedure.Block.", "ISI"


```r
# remove the practice session
chinese = filter(chinese, Procedure.Block. != "pracproc")
# remove missing data in response
chinese_1 = filter(chinese,  !is.na(insex1.RESP))
chinese_2 = filter(chinese, insex1.RESP != "" )
# select the variable you need
chinese_3 = select(chinese_2, subject = "Subject",
                stimuli = "tone.Trial.",
                response = "insex1.RESP",
                response_rt = "insex1.RT",
                rating = "exprate.RESP",
                rating_rt = "exprate.RT",
                block = "Procedure.Block.", ExperimentName)
# you can also use rename() function to rename.
```
******

## Tranform your data

### Making new variables
 + dplyr::mutate(data, newcol = col1+col2)
  - dplyr::mutate(data, newcol = str_extract(col1, "regular expression"))
  - dplyr::mutate(data, newcol = recode(col1, 
                         a = "newname1", b = "newname2"))
 + dplyr::transmute(data, newcol = col1+col2) Drop all origianl columns

### Combine data sets
 + dplyr::left_join(a, b, by = "col2")
 + dplyr::bind_row(a,b)

******

### It's time to get our hands dirty!
+ Challenge 4: create a new column named ISI (with info in the ExperimentName).
+ challenge 5: recode the **block** column into different cognitive load conditions.
block1 -->"ss", block2 --> "ss", block3 --> "sd", block4 --> "sd", block5 --> "ds", block6 -->"ds",block7 -->"dd"

******


```r
chinese_4 = mutate(chinese_3, ISI = str_extract(ExperimentName, "2000|500"))
#chinese_4 = transmute(chinese_3, ISI = str_extract(ExperimentName, "2000|500"))

chinese_5 = mutate(chinese_4, cgload = recode(block, 
                         block1 = "ss", block2 = "ss",
                         block3 = "sd", block4 = "sd",
                         block5 = "ds", block6 = "ds",
                         block7 = "dd"))
```
******

###To many dataframe names!!!!

## Streamline your data wrangling with the pipeline "%>%"

******


```r
cn_clean = chinese %>% 
  filter(., Procedure.Block. != "pracproc") %>%
  mutate(ISI = str_extract(ExperimentName, "2000|500"))%>%
  select(subject = "Subject",
                stimuli = "tone.Trial.",
                response = "insex1.RESP",
                response_rt = "insex1.RT",
                rating = "exprate.RESP",
                rating_rt = "exprate.RT",
                block = "Procedure.Block.",
                isi = "ISI")%>%
  filter(., response !="")%>%
  mutate(cgload = recode(block, 
                         block1 = "ss", block2 = "ss",
                         block3 = "sd", block4 = "sd",
                         block5 = "ds", block6 = "ds",
                         block7 = "dd"))
```

***

### What about the Vietnamese data?

## Build your own function

> function_name = function(input){  
> do thing 1  
> do thing 2  
> return(output)  
> }  

### put your function at the top together with the packages you want to use


```r
data.clean = function(rawdata){ 
  filter(rawdata, Procedure.Block. != "pracproc") %>%
  mutate(ISI = str_extract(ExperimentName, "2000|500"))%>%
  select(subject = "Subject",
                stimuli = "tone.Trial.",
                response = "insex1.RESP",
                response_rt = "insex1.RT",
                rating = "exprate.RESP",
                rating_rt = "exprate.RT",
                block = "Procedure.Block.",
                isi = "ISI")%>%
  filter(., response !="")%>%
  mutate(cgload = recode(block, 
                         block1 = "ss", block2 = "ss",
                         block3 = "sd", block4 = "sd",
                         block5 = "ds", block6 = "ds",
                         block7 = "dd"))->clean_data
  return(clean_data)
}

#apply the function
vt_clean = data.clean(vietnamese)
```

******

## summarize your data
 + dplyr:: summarise(data, new_coloum = mean(col1))
 + dplyr:: summarise_each(data, new_coloum = mean(col1))
 + dplyr:: group_by(data, column1, column2)

******

### Let's get our hands dirty
 + Challenge 6: how many times does each subject choose each response?
 + Challegne 7: what is the mean reaction time for each subject for each reponse?
 

```r
cn_clean%>%
  group_by(subject)%>%
  count(response)
```

```
## # A tibble: 8 x 3
## # Groups:   subject [2]
##   subject response     n
##     <int> <fct>    <int>
## 1     111 f           25
## 2     111 g           22
## 3     111 h           37
## 4     111 j           54
## 5     116 f           33
## 6     116 g           50
## 7     116 h           16
## 8     116 j           36
```

```r
cn_clean%>%
  group_by(subject, response)%>%
  summarise(new_coloum = mean(response_rt))
```

```
## # A tibble: 8 x 3
## # Groups:   subject [?]
##   subject response new_coloum
##     <int> <fct>         <dbl>
## 1     111 f              574.
## 2     111 g              584.
## 3     111 h              377.
## 4     111 j              528.
## 5     116 f             1156.
## 6     116 g              813.
## 7     116 h              829.
## 8     116 j             1000.
```

```r
#you can do more!
cn_clean%>%
  group_by(subject, response)%>%
  summarise(mean_rt = mean(response_rt), sd_rt = sd(response_rt))
```

```
## # A tibble: 8 x 4
## # Groups:   subject [?]
##   subject response mean_rt sd_rt
##     <int> <fct>      <dbl> <dbl>
## 1     111 f           574.  370.
## 2     111 g           584.  452.
## 3     111 h           377.  230.
## 4     111 j           528.  408.
## 5     116 f          1156.  819.
## 6     116 g           813.  656.
## 7     116 h           829.  608.
## 8     116 j          1000.  707.
```

```r
cn_clean%>%
  group_by(response)%>%
  summarise(mean_rt = mean(response_rt), sd_rt = sd(response_rt))%>%
  ggplot(.,aes(response, mean_rt))+
  geom_bar(aes(response, mean_rt), stat = "identity")+
  geom_errorbar(aes(ymin = mean_rt - sd_rt,
                    ymax = mean_rt + sd_rt),
                width = .2, size = 0.7)+
  geom_point(shape = 15, size = 4)+ 
    ggtitle(" Response time by Mandarin speakers")
```

![](WS_data_wrangling_r_files/figure-html/Eploration data analysis-1.png)<!-- -->

## long data vs. wide data


Product | Attribute | Value
--------|-----------|------
A       | Height    | 10
--------|-----------|------
A       | Width     | 5
--------|-----------|------
A       | Weight    | 2
--------|-----------|------
B       | Height    | 20
--------|-----------|------
B       | Width     | 10
--------|-----------|------


Product | Height | Width | Weight
--------|--------|-------|-------
A       | 10     | 5     | 2
--------|--------|-------|-------
B       | 20     | 10    | NA
--------|--------|-------|-------

>More often than not, the outputs from the presentation softwares are in long format.This is a good thing as it is easy to visualize and model long format data. But if the data is in wide formation, we can use the following gather() function to change that into the long format. Ocassionally, we need to change a long format data into wide format by spread() function.

 * tidyr:: spread(data, key, value)
 * tidyr:: gather(data, col1, col2, key, value)

******


```r
table = cn_clean%>%
  #add a counter for each response
  mutate(counter = 1)%>%
  group_by(subject, isi, cgload, stimuli, response)%>%
  summarise(counter = sum(counter))%>%
  mutate(percentage = counter/sum(counter),
         sum = sum(counter))%>%
  group_by(cgload, stimuli, response)%>%
  summarise(cat.mean = round (sum(percentage)/2, 3))%>%
  spread(stimuli, cat.mean)

table2 = gather(table, "21","33","45","241","315", key = "stimuli", value = "percentage")
```

### challenge 8: do the same thing for the vietnamese data
