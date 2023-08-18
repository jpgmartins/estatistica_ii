# Simulação de distribuição normal padrão com valores aleatórios
n <- 1000  # Número de amostras
dados <- rnorm(n)  # Gera n valores aleatórios de uma distribuição normal padrão

# Plotando um histograma para visualizar a distribuição
hist(dados, main="Histograma da Distribuicao Normal Padrao", xlab="Valores", ylab="Frequencia")

# Calculando a média e o desvio padrão dos dados simulados
media <- mean(dados)
desvio_padrao <- sd(dados)
cat("Média:", media, "\nDesvio Padrão:", desvio_padrao)


# Simulação de distribuição normal padrão com diferentes tamanhos de amostra
tamanhos_amostra <- c(10, 100, 1000)  # Tamanhos de amostra diferentes
num_simulacoes <- 1000  # Número de simulações para cada tamanho de amostra

# Loop para simular e calcular médias para cada tamanho de amostra
for (n in tamanhos_amostra) {
  medias <- numeric(num_simulacoes)
  for (i in 1:num_simulacoes) {
    amostra <- rnorm(n)
    medias[i] <- mean(amostra)
  }
  
  # Plotando um histograma das médias
  hist(medias, main=paste("Histograma das Médias (n =", n, ")"), xlab="Médias", ylab="Frequência")
}
