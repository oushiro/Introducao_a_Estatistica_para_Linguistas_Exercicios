#Script para criar tabela DS.real.time com comparação de resultados de Labov, Fowler e Guy et al

library(tidyverse)
study<-c("Labov63", "Fowler86", "Guyetal08")
r1 <- c(29, 39, 57, 20, 28, 60)
store <- c("Saks", "Saks", "Saks", "Macys", "Macys", "Macys")
cbind(study, r1, store)->DS.real.time
DS.real.time <- as.data.frame(DS.real.time)
DS.real.time$r1 <- as.numeric(DS.real.time$r1)
DS.real.time$study <- as.factor(DS.real.time$study)
DS.real.time$study <- fct_relevel(DS.real.time$study, "Labov63", "Fowler86", "Guyetal08")
DS.real.time$store <- as.factor(DS.real.time$store)
str(DS.real.time)
