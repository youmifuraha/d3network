## d3network 이용해보자!!

library(devtools)
library(RCurl) 

library(d3Network)

# 크롤링 해보자

library(rvest)  
library(ggplot2) 
library(ggmap)
library(xml2)  

# html 파일 가져오기
html.idol = read_html("https://ko.wikipedia.org/wiki/%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD%EC%9D%98_%EC%95%84%EC%9D%B4%EB%8F%8C_%EA%B7%B8%EB%A3%B9_%EB%AA%A9%EB%A1%9D")

html.idol
View(html.idol)

# 첫 번째 테이블만 추출
df_raw = html_table(html_nodes(html.idol, "table")[[5]], fill = TRUE)
#-_- 안됨. 자꾸 에러.

# 축구선수로 해보자.
html.footballers = read_html("https://www.theguardian.com/football/datablog/2012/dec/24/world-best-footballers-top-100-list")

html.footballers

# 첫 번째 테이블만 추출
df_raw = html_table(html_nodes(html.footballers, "table")[[1]], fill = TRUE)
# 헐 됐어!!!ㅠㅠㅠ
# 첫째줄 삭제?

df_footballers = df_raw[-c(1),]
View(df_footballers)
# ㅠㅠ 감동

d3SimpleNetwork(df_footballers, width = 400, height = 250, textColour = "orange", linkColour = "red", nodeColour = "orange", opacity = 0.9, file="test5.html")

# 헐... 이건 아닌듯.

# 이름이랑 국적만 묶어보장.
df_nationality = df_footballers %>% 
  select(Name, Nationality)
View(df_nationality)

d3SimpleNetwork(df_nationality, width = 500, height = 500, textColour = "orange", linkColour = "red", nodeColour = "orange", opacity = 0.9, file="test6.html")

?d3SimpleNetwork

# 타겟 지정 7.
d3SimpleNetwork(df_footballers, Source = Name, Target = Position, width = 500, height = 500, textColour = "orange", linkColour = "red", nodeColour = "orange", opacity = 0.9, file="test7.html")


d3SimpleNetwork(df_footballers, Name, Position, width = 500, height = 500, textColour = "orange", linkColour = "red", nodeColour = "orange", opacity = 0.9, file="test7.html")

# 안됨 안됨 안됨 !!