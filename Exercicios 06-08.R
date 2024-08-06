install.packages("wooldridge")
library(wooldridge)

####### C1
c1 <- wage1
?wage1

### 1
mean(c1$educ)
#12.56
min(c1$educ)
#0
max(c1$educ)
#18

### 2
mean(c1$wage)
#5.90, parece baixo

### 5
table(c1$female)

# exitem 252 mulheres e 274 homens


####### C2
c2 <- bwght
?bwght

### 1
table(c2$cigs)
1388-1176
#Existem 1388 mulheres. Dessas, 212 fumaram durante a gravidez

### 2
mean(bwght$cigs)
#Media de 2 cigarros por dia, o que não é bom considerando a gravidez

### 3
bwght2 <- bwght %>% filter(cigs != 0)
mean(bwght2$cigs)

#A média foi pra 14 cigarros por dia. Considerando que anteriormente eram considerados os valores nulos, agora a quantidade é ainda mais preocupante

### 5
mean(bwght$faminc)
#Média de 29 mil dólares
sd(bwght$faminc)
#Desvio padrão de 19 mil dólares


####### c5
c5 <- fertil2
?fertil2

### 1
mean(c5$children)
min(c5$children)
max(c5$children)

#Média de 2 crianças, mínimo de 0 e máximo de 13


### 2
c5ele <- c5 %>% filter (electric =='1')

(nrow(c5ele))/(nrow(c5))

#14% das pessoas tem eletricidade em casa


### 3
c5nele <- c5 %>% filter (electric =='0')

mean(c5ele$children)
mean(c5nele$children)

#A média das que tem eletricidade é 1,9 crianças, enquanto as que não tem é 2.3 crianças.


### 4
#Pelo contrário, ter eletricidade significa ter mais filhos.


####### c6
c6 <- countymurders
?countymurders

c1996 <- c6 %>% filter (year=='1986')

nrow(c1996)

#Existem 2197 condados no dados.

c60as <- c1996 %>% filter(murders=='0')
nrow(c60as)
#Em 895 condados não houveram assassinatos.

c60ex <- c1996 %>% filter(execs=='0')
nrow(c60ex)

#Em 2188 condados não houveram execuções.

(nrow(c60ex))/(nrow(c1996))

#99,6% dos condados não tiveram execuções.


### 2
max(c1996$murders)
max(c1996$execs)
mean(c1996$execs)

#O máximo de assassinatos foi 1409. O máximo de execuções foi 4. A média de execuções foi 0.005, provavelmente pois em pouco condados a execução é permitida.


### 3
cor(c1996$murders,c1996$execs)
# Há uma correlação de 0.25 entre o número e assassinatos e o número de execuções.

### 4
#Pelo contrário, em locais com mais assassinatos há maior número de execuções. Provavelmente a população desses locais tem os ânimos mais exaltados quanto ao assunto e aprova a pena de morte.


####### 7 
c7 <- alcohol
?alcohol

### 1
c7ab <- c7 %>% filter(abuse=='1')
c7em <- c7 %>% filter(status=='3')

(nrow(c7ab))/(nrow(c7))
(nrow(c7em))/(nrow(c7))

#9,9% do homens relataram abuso de álcool. 89.81% estavam empregados.

### 2
table(c7ab$status)
850/(850+83+41)

#87,26%  dos homens estão empregados.

### 3
c7nab <- c7 %>% filter(abuse=='0')
table(c7nab$status)
7972/(7972+275+601)

#90% dos homens estão empregados.

### 4
# A diferença é muito pequena. Portanto, não é razoável dizer que o abuso de álcool causa desemprego. Na verdade, eles precisam é de dinheiro para consumir o produto.