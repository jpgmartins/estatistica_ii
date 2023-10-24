#'*----------------------------------------------------------------------------*
#'*-------------------------- Lista 05: Econometria ---------------------------*
#'*----------------------------------------------------------------------------*

#'*Autor: Thiago Nakamura*
#'*Data: 21/10/23*

# Setando o diretório

setwd("C:/Users/Thiago/Documents/IRI-USP/8 Semestre 2023-2/Monitoria - Estatística Aplicada II/Listas")

#'* Pacotes necessários -------------------------------------------------------*

library(readxl)
library(tidyverse)

#'* Importação das bases ------------------------------------------------------*

margarine <- read_excel("lista6_EAII.xlsx") # Base da margarina
butter <- read_excel("lista5_EAII.xlsx") # Base da manteiga

# Vamos visualizar as bases
View(margarine)
View(butter)

#'* Manipulação das bases -----------------------------------------------------*

# Transformando em números as colunas de margarine
margarine$Consumption <- as.numeric(margarine$Consumption)
margarine$Price <- as.numeric(margarine$Price)

# Vamos verificar a classe das colunas de butter
class(butter$Year) # numeric
class(butter$`Real income`) # character
class(butter$`Price of butter`) # character

# Transformando em números as colunas de butter
butter$`Real income` <- as.numeric(butter$`Real income`)
butter$`Price of butter` <- as.numeric(butter$`Price of butter`)

# Vamos agora juntar as bases lateralmente a partir de coluna comum às duas
base <- merge(margarine, butter, by = "Year")

# Um nome de qualquer coisa no R deve evitar ter acentos e espaços (complicações),
# e letras maiúsculas (padrão e eficiência). 
# Por exemplo, podemos substituir os espaços por _

# Vamos mudar os nomes das variáveis de base. Com o comando abaixo precisamos 
# ordenar os novos nomes na mesma ordem dos velhos nomes

colnames(base) # Os nomes das colunas (sem precisar olhar p/ base)

colnames(base) <- c("Year", "Cons_margarine", "Price_margarine", "Price_butter",
                    "Income")


#'* Regressão -----------------------------------------------------------------*

# Questão 1a (regressão e testes)

reg <- lm(Cons_margarine ~ Price_margarine + Price_butter + Income, base)

summary(reg)

# Questão 1d (elasticidade)

reg_log <- lm(log(Cons_margarine) ~ log(Price_margarine) + log(Price_butter) + log(Income), base)

summary(reg_log)

# Questão 2a (previsão)

# os dados da tabela são
dados_q2 = data.frame(Year = c(1989, 1990),
                      Cons_margarine = c(3.47, 3.19), # item b
                      Price_margarine = c(79.3, 79.3), 
                      Price_butter = c(104.3, 97), 
                      Income = c(120.2, 122.7))
View(dados_q2)

# Previsão

## 1989
c1989 <- reg$coefficients[1] + # intercepto
  reg$coefficients[2]*dados_q2$Price_margarine[1] + # coef * variavel
  reg$coefficients[3]*dados_q2$Price_butter[1] + 
  reg$coefficients[3]*dados_q2$Income[1]

## 1990
c1990 <- reg$coefficients[1] +
  reg$coefficients[2]*dados_q2$Price_margarine[2] +
  reg$coefficients[3]*dados_q2$Price_butter[2] +
  reg$coefficients[3]*dados_q2$Income[2]

# Questão 2b (comparar o real com o estimado)

c1989/dados_q2$Cons_margarine[1] # 71% a mais

c1990/dados_q2$Cons_margarine[2] # 83% a mais

