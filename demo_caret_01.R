# Demonstração de uso do pacote Caret para machine learning no R

# Diretório de trabalho no OS X
setwd('/Users/ls_rafael/Documents/GitHub/machine_learning_com_caret')

#### 1. Setup Pacotes ####
install.packages('caret')
install.packages('randomForest')

#### 2. Load Pacotes ####
library(caret)
library(randomForest)
library(datasets)

# Visualização das funções contidas no pacote Caret
# O pacote Caret é muito completo para machine learning
names(getModelInfo())

#### 3. Visualização do mtcars ####
View(mtcars)

#### 4. Splitting do Dataset ####
# A variável mpg será a variável alvo
?createDataPartition
index <- createDataPartition(y = mtcars$mpg, p = 0.7, list = FALSE)

ds_treino <- mtcars[ index, ]
ds_teste  <- mtcars[-index, ]

#### 5. Treinamento do Modelo ####
# ATENÇÃO: Existe a função train() também no pacote generics
?caret::train

#### 6. Análise de Relevância das Variáveis ####
?varImp

# É necessário criar um modelo para analisar a relevância das variáveis
# Análise de Relevância para um modelo linear
modelo_v1 <- train(mpg ~., data = ds_treino, method = 'lm')
varImp(modelo_v1)
# lm variable importance
# Overall
# wt   100.0000
# cyl   63.1621
# disp  31.3797
# carb  24.3267
# hp    23.5990
# drat  11.8430
# am     7.2906
# qsec   2.8672
# gear   0.7745
# vs     0.0000

# Conforme a análise de relevância, as variáveis cyl e wt possuem força de correlação de 63% e 100% respectivamente

#### 7. Treinamento dos Modelos com as Variáveis mais Relevantes ####
modelo_v1 <- train(mpg ~ wt + cyl, data = ds_treino, method = 'lm')
modelo_v2 <- train(mpg ~ wt + cyl + disp, data = ds_treino, method = 'lm')
modelo_v3 <- train(mpg ~ wt + cyl + disp + carb, data = ds_treino, method = 'lm')
modelo_v4 <- train(mpg ~ wt + cyl + disp + carb + hp, data = ds_treino, method = 'lm')
modelo_v5 <- train(mpg ~ wt + cyl + disp + carb + hp + drat, data = ds_treino, method = 'lm')
modelo_v6 <- train(mpg ~ wt + cyl + disp + carb + hp + drat + am, data = ds_treino, method = 'lm')
modelo_v7 <- train(mpg ~ wt + cyl + disp + carb + hp + drat + am + qsec, data = ds_treino, method = 'lm')
modelo_v8 <- train(mpg ~ wt + cyl + disp + carb + hp + drat + am + qsec + gear, data = ds_treino, method = 'lm')
modelo_v9 <- train(mpg ~ wt + cyl + disp + carb + hp + drat + am + qsec + gear + vs, data = ds_treino, method = 'lm')

#### 8. Resumo Descritivo dos Resultados de Precisão ####
summary(modelo_v1) # Coeficiente de Determinação: 84,90%
summary(modelo_v2) # Coeficiente de Determinação: 85,88%
summary(modelo_v3) # Coeficiente de Determinação: 87,47%
summary(modelo_v4) # Coeficiente de Determinação: 87,68%
summary(modelo_v5) # Coeficiente de Determinação: 87,78%
summary(modelo_v6) # Coeficiente de Determinação: 87,82%
summary(modelo_v7) # Coeficiente de Determinação: 87,84%
summary(modelo_v8) # Coeficiente de Determinação: 87,85%
summary(modelo_v9) # Coeficiente de Determinação: 87,86%

























