install.packages('readr')
library(readr)

dados <- read.csv("C:/Users/20181enpro0015/downloads/olimpiadas.csv")

############# tabela de frequencia

#tabelas simples
table(dados$Sex)

table(dados$Sex)/nrow(dados)

#tabela de dupla entrada
table(dados$Sex,dados$NOC) 

#dados somente do brasil
install.packages('dplyr')
library(dplyr)

dados_brasil <- dados %>% filter(NOC=="BRA")
table(dados_brasil$Sex)

############ graficos

install.packages('esquisse')
library(esquisse)

library(ggplot2)

ggplot(dados) +
 aes(x = Sex) +
 geom_bar(fill = "#112446") +
 theme_minimal()

############ estatisticas descritivas
### para a idade 

#min
min(dados$Age, na.rm=TRUE)
#max
max(dados$Age, na.rm=TRUE)
#media
mean(dados$Age, na.rm=TRUE)
#desvio padrao
sd(dados$Age, na.rm=TRUE)

### para o peso
dados_f <- dados %>% filter(Sex=='F')
dados_m <- dados %>% filter(Sex=='M')

min(dados_f$Weight, na.rm=TRUE)
max(dados_f$Weight, na.rm=TRUE)
mean(dados_f$Weight, na.rm=TRUE)
sd(dados_f$Weight, na.rm=TRUE)

min(dados_m$Weight, na.rm=TRUE)
max(dados_m$Weight, na.rm=TRUE)
mean(dados_m$Weight, na.rm=TRUE)
sd(dados_m$Weight, na.rm=TRUE)

#ou...
dados %>% group_by(Sex) %>% summarise(media = mean(Weight,na.rm=TRUE))

