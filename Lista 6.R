#'*----------------------------------------------------------------------------*
#'*-------------------------- Lista 06: Econometria ---------------------------*
#'*----------------------------------------------------------------------------*

#'*Autor: Thiago Nakamura*
#'*Data: 19/10/23*

# Tudo que vem depois da hashtag (#) não tem efeito e será um comentário

# Primeiro vamos importar os dados da Questão 1. Antes precisamos passar para
# algum formato que seja legível para o R. Podemos passar para excel (.xlsx),
# text (.csv ou .txt) ou stata (.dta). Por conveniência, posso printar
# a imagem da tabela na lista e o excel reconhece e passa para as células.

#'* Vamos escolher o diretório antes ------------------------------------------* 
# O diretório é a pasta em que estão os arquivos que precisamos que o R leia.
# Também podemos criar, salvar e alterar os arquivos desse diretório.
#'*Obs.: a barra é pra ser '/' e não '\'*

setwd("C:/Users/Thiago/Documents/IRI-USP/8 Semestre 2023-2/Monitoria - Estatística Aplicada II/Listas")

#'* Vamos ler a base de dados em xlsx -----------------------------------------*
# Precisamos antes instalar o pacote com o comando para ler a base em .xlsx

#install.packages("readxl") # vai aparecer umas mensagens na sua tela 

# Vamos carregar/ativar o pacote

library(readxl) 

# Agora vamos ler a base e assinalar um nome para ela
# O nome do arquivo está entre aspas e o nome da base que o R vai ler é base_margarina
# O comando é read_excel() e permite ler arquivos em formato excel (xls e xlsx)

base_margarina <- read_excel("lista6_EAII.xlsx") 

# Vamos visualizar a base. Note que a primeira linha veio como título das colunas

View(base_margarina)

#'* Vamos plotar um gráfico do preço e quantidade -----------------------------*
# Vamos usar um pacote muito amplo para isso (ele ativa vários outros).
# Ele permite uma série de comandos para gráficos e manipulação de base de dados.

#install.packages("tidyverse")
library("tidyverse")

# Antes de irmos aos gráficos, vamos verificar a classe dos nossos dados.
# Existem algumas classes e elas determinam como o R trata os dados.
# Dentre elas estão: character (nomes), numeric (números) e logical (T ou F).
# Além disso, usar $ depois do nome da base, seguido do nome da coluna, especifica
# a coluna que queremos.

class(base_margarina$Year) # Classe dos dados da coluna Year é numeric
class(base_margarina$Consumption) # Classe dos dados da coluna Consumption é character
class(base_margarina$Price) # Classe dos dados da coluna Price é character

# Temos um problema: precisamos que o R leia as colunas Consumption e Price como
# numeric. Vamos fazer isso abaixo:

base_margarina$Consumption <- as.numeric(base_margarina$Consumption)
base_margarina$Price <- as.numeric(base_margarina$Price) 

# A lógica aqui é "tal coluna é ela mesma só que numérica" (substituiu na base já)

# Vamos aos gráficos (Questão 1a)
ggplot(base_margarina, aes(x = Consumption, y = Price)) + # determinamos os eixos a partir de uma base
  geom_point() + # gráfico de pontos
  geom_smooth(method = "lm", se = T) + # linha de tendência ("lm" é o MQO)
  labs(title = "Gráfico de Dispersão da Margarina", # Adiciona rótulos
       x = "Consumo",
       y = "Preço")


# A lógica aqui é adicionarmos camadas ao gráfico.


#'* Vamos calcular a correlação e fazer a regressão da quantidade no preço ----*

# Correlação
cor(base_margarina$Consumption, base_margarina$Price)

# Regressão
reg <- lm(Consumption ~ Price, base_margarina)

# Observando as estatísticas da regressão
summary(reg)

# Calculando a elasticidade (vamos ver o coeficiente da regressão log-log)
reg_log <- lm(log(Consumption) ~ log(Price), base_margarina)
summary(reg_log)

# Os coeficientes estão armazenados aqui
reg$coefficients

# Para selecionar o intercepto podemos selecionar a primeira coluna de reg$coefficients
reg$coefficients[1]

# Para o coeficiente estimado do preço, selecionamos a segunda
reg$coefficients[2]

# Prevendo o consumo a um preço de 70 (Questão 3)
reg$coefficients[1] + reg$coefficients[2]*70

