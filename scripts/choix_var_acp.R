#PHASE 1 : DIAGNOSTIC DES DONNEES NETTOYAGE ET CHOIX DES VARIABLES POUR PREMIER ACP 

#Importation des librairies
library(psych)
install.packages("tidyverse")
library(tidyverse)
install.packages("corrplot")

#Importation du dataset
data_heart_attack<-read.csv("data/Heart Attack Data Set.csv", header = TRUE)

#Visualisation du dataset
head(data_heart_attack)
summary(data_heart_attack)

#Detection de valeurs aberrantes
par(mfrow= c(2,3))

var_continue<-c("age", "trestbps", "chol", "thalach", "oldpeak")

for (v in var_continue){
  boxplot(data_heart_attack[[v]],main= paste("Boxplot of" , v),col="skyblue",border="black", horizontal=TRUE)
}

#Creation d'un nouveau dataset
df_acp<-data_heart_attack %>%
 select(age,trestbps,oldpeak,thalach,chol,ca)  
head(df_acp)
cor_matrix<-cor(df_acp)
library(corrplot)
corrplot(cor_matrix,method="color",type="upper",addCoef.col="black",t.col="black",diag=FALSE)