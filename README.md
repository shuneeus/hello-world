# Political data analysis lectures

This repo contains some of my lectures as a teaching assistant in political data analysis. 

## Lecture 5: Building a confidence interval for a sample mean 
The next code is an example el lecture number 5, for building a 95% confidence interval for the sample mean. The code allows to play with the sample size, the mean and standard deviation of the data, its underlying distribution and the confidence level (z).  

```
sample <- tibble(a=rnorm(100, 2, 4)) 

z<-1.96

tibble(n = nrow(sample), 
       mean  = mean(sample$a), 
       se  = sd(sample$a) / sqrt(n), 
       ci_sup =  mean + z*se,
       ci_lo = mean + z*-se, 
       ci = ci_sup - ci_lo) %>% View()
```
 
