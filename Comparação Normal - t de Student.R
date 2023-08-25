# Carregue o pacote ggplot2
library(ggplot2)

# Crie um vetor de valores para o eixo x
x <- seq(-4, 4, length.out = 1000)

# Crie um data frame com os valores das densidades de probabilidade
data <- data.frame(
  x = rep(x, times = 6),
  density = c(dnorm(x), dt(x, df = 3), dt(x, df = 10), dt(x, df = 30), dt(x, df = 50), dt(x, df = 100)),
  distribution = rep(c("Normal", "t (df=3)", "t (df=10)", "t (df=30)", "t (df=50)", "t (df=100)"), each = length(x))
)

# Gráfico 1: Comparação entre a normal e as distribuições t com diferentes graus de liberdade
ggplot(data, aes(x = x, y = density, color = distribution, linetype = distribution)) +
  geom_line(size = 1) +
  labs(
    title = "Comparação: Normal vs. t com diferentes graus de liberdade",
    x = "Valor",
    y = "Densidade de Probabilidade"
  ) +
  scale_color_manual(values = c("Normal" = "blue", "t (df=3)" = "red", "t (df=10)" = "green", "t (df=30)" = "purple", "t (df=50)" = "orange", "t (df=100)" = "pink")) +
  scale_linetype_manual(values = c("Normal" = "solid", "t (df=3)" = "dotted", "t (df=10)" = "dashed", "t (df=30)" = "dotdash", "t (df=50)" = "longdash", "t (df=100)" = "twodash")) +
  theme_minimal()


# Gráfico 2: Comparação entre a normal e a distribuição t com 3 graus de liberdade
ggplot(data, aes(x = x, y = density, color = distribution, linetype = distribution)) +
  geom_line(size = 1) +
  labs(
    title = "Comparação: Normal vs. t com 3 graus de liberdade",
    x = "Valor",
    y = "Densidade de Probabilidade"
  ) +
  scale_color_manual(values = c("Normal" = "blue", "t (df=3)" = "red")) +
  scale_linetype_manual(values = c("Normal" = "solid", "t (df=3)" = "dotted")) +
  theme_minimal()

# Gráfico 3: Comparação entre a normal e a distribuição t com 10 graus de liberdade
ggplot(data, aes(x = x, y = density, color = distribution, linetype = distribution)) +
  geom_line(size = 1) +
  labs(
    title = "Comparação: Normal vs. t com 10 graus de liberdade",
    x = "Valor",
    y = "Densidade de Probabilidade"
  ) +
  scale_color_manual(values = c("Normal" = "blue", "t (df=10)" = "green")) +
  scale_linetype_manual(values = c("Normal" = "solid", "t (df=10)" = "dashed")) +
  theme_minimal()

# Gráfico 4: Comparação entre a normal e a distribuição t com 30 graus de liberdade
ggplot(data, aes(x = x, y = density, color = distribution, linetype = distribution)) +
  geom_line(size = 1) +
  labs(
    title = "Comparação: Normal vs. t com 30 graus de liberdade",
    x = "Valor",
    y = "Densidade de Probabilidade"
  ) +
  scale_color_manual(values = c("Normal" = "blue", "t (df=30)" = "purple")) +
  scale_linetype_manual(values = c("Normal" = "solid", "t (df=30)" = "dotdash")) +
  theme_minimal()

# Gráfico 5: Comparação entre a normal e a distribuição t com 50 graus de liberdade
ggplot(data, aes(x = x, y = density, color = distribution, linetype = distribution)) +
  geom_line(size = 1) +
  labs(
    title = "Comparação: Normal vs. t com 50 graus de liberdade",
    x = "Valor",
    y = "Densidade de Probabilidade"
  ) +
  scale_color_manual(values = c("Normal" = "blue", "t (df=50)" = "orange")) +
  scale_linetype_manual(values = c("Normal" = "solid", "t (df=50)" = "longdash")) +
  theme_minimal()

# Gráfico 6: Comparação entre a normal e a distribuição t com 100 graus de liberdade
ggplot(data, aes(x = x, y = density, color = distribution, linetype = distribution)) +
  geom_line(size = 1) +
  labs(
    title = "Comparação: Normal vs. t com 100 graus de liberdade",
    x = "Valor",
    y = "Densidade de Probabilidade"
  ) +
  scale_color_manual(values = c("Normal" = "blue", "t (df=100)" = "pink")) +
  scale_linetype_manual(values = c("Normal" = "solid", "t (df=100)" = "twodash")) +
  theme_minimal()

#
