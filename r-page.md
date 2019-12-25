---
layout: page
title: R
subtitle: Annotated R learning recources
bigimg: /img/r-page.png
---

The first thing I need to do whenever I run an R workshop is to provide my participants some motivations that why they should bother learning R. 

Below are some of the cool things you can do with R, ranging from data analysis, modeling, visualization to making slides, dashboards, blogpost, interactive tutorials...

#### Statistical Modeling
First thing first, most people get to know about R and feel like using it, particulary for reseearch purposes because they have to do some statistical modelling and there is a R package that can do the job. In fact, statistical modeling is one of R's advantages. For simple stats modelling, SPSS, a program with no coding requirements, can do as good as R and many people are still relying on that for their stats. But SPSS is not open source and is owned by a company while R is open source and users all around the world can contribute to enriching its fuctionalities via packages. But this advantage is not obvious in terms of simple stats models, such as t-tests. With this said, [this website](https://rcompanion.org/handbook/index.html) *Summary and Analysis of Extension Program Evaluation in R*, is my go-to place when I need to see how to t-tests (of all kinds), ANOVA, regression. For more complicated and sophisticated models, you can simple google: "model name" with R.

#### Data wrangling

However, the data you get may not be ready as model input, and you will need to preproces them or in a more technical term data wrangling. Many functionalities R provides can be realized in Excel. But Excel cannot record the workflow in a nature way and has problems with very large data. There are too many packages that can do too many things in data preprocessing. A good starting point and reference point is [R for Data Science](https://r4ds.had.co.nz/) by Garrett Grolemund and Hadley Wickham. I also have a [tutorial](https://juqiangj.github.io/DH_Data_wrangling/) for data wrangling which I used to run a three-hour workshop.

#### Data visualization
Most time as linguistic researchers or speech scientists, we do data visualization in a static way, for journal publications or reports. R has a very powerful data visualization package called ggplot2. 

A good and comprehensive introduction would be [*ggplot2: Elegant Graphics for Data Analysis*](https://ggplot2-book.org/index.html).

For quick references, this is my [go-to place](http://www.cookbook-r.com/Graphs/) when I do not know how to change small things like font size of a legend. The author of this site also has a free online e-book, [*R Graphics Cookbook, 2nd edition*](https://r-graphics.org/).

For people who are interested in doing **map visualization**, [*Geocomputation with R*](https://geocompr.robinlovelace.net/), a book on geographic data analysis, visualization and modeling, prvoides a good introduction.

You can also use R for **network visualization**, and here are some  comprehensive tutorials:

* [*Static and dynamic network visualization with R*](http://kateto.net/network-visualization)
* [*Introduction to Network Analysis with R*](https://www.jessesadler.com/post/network-analysis-with-r/)
* [ggnet2: network visualization with ggplot2](https://briatte.github.io/ggnet/)

And this is an academic [paper](https://journal.r-project.org/archive/2017/RJ-2017-023/index.html) about network visualization issues.

It is also possbile to do **diagrams** in R, you can use a package called [DiagramR](https://rich-iannone.github.io/DiagrammeR/).

#### Text analysis/mining
Text mining is the process of deriving high-quality information from text. Text mining usually involves the process of structuring the input text (usually parsing, along with the addition of some derived linguistic features and the removal of others, and subsequent insertion into a database), deriving patterns within the structured data, and finally evaluation and interpretation of the output. 'High quality' in text mining usually refers to some combination of relevance, novelty, and interest. Typical text mining tasks include text categorization, text clustering, concept/entity extraction, production of granular taxonomies, sentiment analysis, document summarization, and entity relation modeling (i.e., learning relations between named entities). ([Wikipedia](https://en.wikipedia.org/wiki/Text_mining))

Text analysis involves information retrieval, lexical analysis to study word frequency distributions, pattern recognition, tagging/annotation, information extraction, data mining techniques including link and association analysis, visualization, and predictive analytics. The overarching goal is, essentially, to turn text into data for analysis, via application of natural language processing (NLP), different types of algorithms and analytical methods. An important phase of this process is the interpretation of the gathered information.

Books: [Text mining with R](https://www.tidytextmining.com/index.html)

#### Web scrapping
We are living in a world of information and the Internet becomes a gaint center of it. Getting information from the Internet can be useful for language researchers who are interested in social variations of language.
Here are some packages and tutorials.
[rvest: easy web scraping with R](https://blog.rstudio.com/2014/11/24/rvest-easy-web-scraping-with-r/) [Tutorial 1](https://www.datacamp.com/community/tutorials/r-web-scraping-rvest) [Tutorial 2](https://www.analyticsvidhya.com/blog/2017/03/beginners-guide-on-web-scraping-in-r-using-rvest-with-hands-on-knowledge/)

#### Social media analysis
As more and more people are deeply imersed in the social media, analyzing their verbal behavior could be potentially revealing. Book: [Learning Social Media Analytics with R](https://learning.oreilly.com/library/view/learning-social-media/9781787127524/)
[Tutorial 1](http://pablobarbera.com/big-data-upf/html/02a-networks-intro-visualization.html)

#### Speech analysis

* wrassp is a wrapper for R around Michel Scheffers’s libassp (Advanced Speech Signal Processor). The libassp library aims at providing functionality for handling speech signal files in most common audio formats and for performing analyses common in phonetic science/speech science. This includes the calculation of formants, fundamental frequency, root mean square, auto correlation, a variety of spectral analyses, zero crossing rate, filtering etc. This wrapper provides R with a large subset of libassp’s signal processing functions and provides them to the user in a (hopefully) user-friendly manner. [Tutorial](https://cran.r-project.org/web/packages/wrassp/vignettes/wrassp_intro.html)

* soundgen builds upon the functionality of *seewave*, adding high-level functions for sound synthesis (see the vignette on sound synthesis), manipulation, and analysis. [Tutorial](https://cran.r-project.org/web/packages/soundgen/vignettes/acoustic_analysis.html)
* EMU-R: The EMU Speech Database Management System (EMU-SDMS) is a collection of software tools which aims to be as close to an all-in-one solution for generating, manipulating, querying, analyzing and managing speech databases as possible. [Manual](https://ips-lmu.github.io/The-EMU-SDMS-Manual/index.html)

#### Writing reports, blogs, slides or books with codes
When you want to output your work with R, it is desirable to embed your code with your analysis. This is not easy with Word or other file types. Thanks to the *rmarkdown* package,  you can now:

* Compile a single R Markdown document to a report in different formats, such as PDF, HTML, or Word.
* Create notebooks in which you can directly run code chunks interactively.
Tutorial: [R Markdown: The Definitive Guide](https://bookdown.org/yihui/rmarkdown/) [Tufte](https://rstudio.github.io/tufte/) [DataTables](https://rstudio.github.io/DT/)

* Generate websites and blogs.
Tutorial: [blogdown: Creating Websites with R Markdown](https://bookdown.org/yihui/blogdown/)

* Author books of multiple chapters.
Tutorial: [bookdown: Authoring Books and Technical Documents with R Markdown](https://bookdown.org/yihui/bookdown/)

* Make slides for presentations
Tutorial: [xaringan, creating remark.js through R Markdown](https://github.com/yihui/xaringan) [reveal.js Presentations](https://bookdown.org/yihui/rmarkdown/revealjs.html) [reveal.js](https://github.com/hakimel/reveal.js#markdown)

* Interactive Tutorials for R [Tutorial](https://rstudio.github.io/learnr/#overview)

* Produce dashboards with flexible, interactive, and attractive layouts. [Short tutorial](https://bookdown.org/yihui/rmarkdown/dashboards.html) [Full tutorial](https://rmarkdown.rstudio.com/flexdashboard/)
* Build interactive applications based on Shiny. [Tutorial](https://shiny.rstudio.com/tutorial/) [Example](https://shiny.rstudio.com/gallery/word-cloud.html) [More examples](https://shiny.rstudio.com/gallery/)

#### More advanced R programming

##### Books

[Advanced R](https://adv-r.hadley.nz/)
The book is designed primarily for R users who want to improve their programming skills and understanding of the language. It should also be useful for programmers coming to R from other languages, as help you to understand why R works the way it does.

[R packages](https://r-pkgs.org/)
Packages are the fundamental units of reproducible R code. They include reusable R functions, the documentation that describes how to use them, and sample data. In this book you’ll learn how to turn your code into packages that others can easily download and use. Writing a package can seem overwhelming at first. So start with the basics and improve it over time. It doesn’t matter if your first version isn’t perfect as long as the next version is better.

[Hands-On Programming with R](https://rstudio-education.github.io/hopr/)

[Efficient R Programming](https://bookdown.org/csgillespie/efficientR/introduction.html)








