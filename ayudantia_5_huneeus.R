## sesion 5. Ayudantia Analisis de datos politicos
## SEBASTIAN HUNEEUS 
## 21 septiembre

## Inferencia estadistica de proporciones y medias con intervalos de confianza 

#devtools::install_github("arcruz0/paqueteadp")


### pequeño repaso: distribucion normal
x=seq(-4,4,length=200) ### 200 numeros de -4 a 4
y=dnorm(x) ### a partir de vector x, genera vector con 200 datos que siguen distribucion normal 
plot(x,y,type="l", lwd=2, col="blue") ### una curva normal 

x=seq(-1,1,length=200)
y=dnorm(x)
polygon(c(-1,x,1),c(0,y,0),col="gray") ### area de la curva a -1 y 1 desviaciones estandares de la media 


### pregunta 1: ¿cual es la probabilidad acumulada dentro esta area, entre -1 y 1 desviaciones estandares?  



polygon(c(-2,x,2),c(0,y,0),col="gray") ### area de la curva a -2 y 2 desviaciones estandares de la media 


### pregunta 2  ¿cuatos casos caben dentro del esta area? 


library(paqueteadp)
library(tidyverse)
library(janitor)

### estimacion de proporciones, para variables categoricas: 

democracia_directa<-paqueteadp::democracia_directa

tabyl(democracia_directa$dem_directa) %>% adorn_pct_formatting() ### proporcion de paises con democracia directa en la base 

### ¿cual es el IC del 95% para esta proporcion? 
###juguemos con distintos n! 

n<-100
z<-  ### buscar en tabla ! 

tibble(
   casos = sample_n(democracia_directa, n) %>%  
    filter(dem_directa ==1)%>% count(),
   n   = n, 
   p   = casos/n, 
   es  = sqrt(p*(1-p)/n), 
   ic_sup =  p + z*es,
   ic_inf = p + z*-es, 
   ic = ic_sup - ic_inf)
  


### ¿cual es el IC del 90% para esta proporcion? 


n<-1000
z<-

tibble(
  casos = sample_n(democracia_directa, n) %>%  
    filter(dem_directa ==1)%>% count(),
  n   = n, 
  p   = casos/n, 
  es  = sqrt(p*(1-p)/n), 
  ic_sup =  p + z*es,
  ic_inf = p + z*-es, 
  ic = ic_sup - ic_inf)



### estimacion de IC para medias del 95%
### para variables cuantitativas !


datos_municipales<-paqueteadp::datos_municipales

n<-1000
t<-  ### buscar en tabla t

muestra<-sample_n(datos_municipales, n) %>% na.omit()

tibble(n = nrow(muestra), 
  media  = mean(muestra$ingreso), 
  es  = sd(muestra$ingreso) / sqrt(n), 
  ic_sup =  media + t*es,
  ic_inf = media + t*-es, 
  ic = ic_sup - ic_inf) %>% View()

