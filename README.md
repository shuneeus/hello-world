# Political data analysis 

This repo contains some of my lectures as a teaching assistant in political data analysis. 

The next code is an example for building a 95% confidence interval for the population proportion of a categorical variabe. The code allows to play with the sample size (n) and confidence level (z).  


```
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
```
 
