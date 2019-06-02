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

# Conforme a análise de relevância, as variáveis cyl e wt possuem força de correlação de 63% e 100% respectivamente

#### 7. Treinamento dos Modelos com as Variáveis mais Relevantes ####

