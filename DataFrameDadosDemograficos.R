
setwd("C:/Users/diego/Desktop/Códigos R")
getwd()

stats <- read.csv("DadosDemográficos.csv")
stats


# --------------------------------------------------

# Explorando dados

nrow(stats) # Este dataframe tem 195 linhas
ncol(stats) # Este dataframe tem 5 colunas

head(stats)
head(stats, n = 10)

tail(stats)
tail(stats, n = 10)

str(stats, n = 10)
summary(stats)


# --------------------------------------------------

# usando o sinal de $

stats
head(stats)

stats[3, 3]
stats[3,"Birth.rate"]
stats$Birth.rate[3]

levels(stats$Income.Group)


# --------------------------------------------------

# Operações básicas com DataFrame

stats

stats[1:10, ]
stats[c(4, 100), ]

## Relembrando os []
stats[1, ]
is.data.frame(stats[1, ]) # não precisa setar o drop para linhas de dataframes

stats[,1]
is.data.frame(stats[,1, drop = F]) #precisa setar o drop para colunas

#exemplo de operações com colunas dos dataframes
stats$Birth.rate + stats$Internet.users
stats$Birth.rate - stats$Internet.users
stats$Birth.rate * stats$Internet.users
stats$Birth.rate / stats$Internet.users

stats$calc <- stats$Birth.rate + stats$Internet.users
head(stats)

stats$calc <- NULL
head(stats)

stats$xyz <- 1:5
head(stats, n = 10)

stats$xyz <- NULL
head(stats, n = 10)

# --------------------------------------------------

# Filtrando DataFrames

filter <- stats$Birth.rate < 20
filter
stats[filter, ]

stats[stats$Birth.rate > 20, ]

stats[stats$Birth.rate > 20 & stats$Internet.users < 80, ]

stats[stats$Income.Group == "High income", ]

head(stats)

stats[stats$Country.Name == "Malta", ]

# --------------------------------------------------

# Visualização utilizando qplot

qplot(data= stats, x=Internet.users)

#grafico de dispersao
qplot(data=stats, x = Income.Group, y=Birth.rate)
#adicionando cor e tamanho

qplot(data=stats, x = Income.Group, y=Birth.rate, size=I(3), colour =I("red"), main = "Natalidade por Riqueza")
#modificando o tipo do grafico
qplot(data=stats, x=Income.Group, y= Birth.rate, geom="boxplot")

# Gráfico de usuários de internet x taxa de natalidade
qplot(data=stats, x=Internet.users, y=Birth.rate)
# Gráfico de usuários de internet x taxa de natalidade agrupados por grupo de renda
qplot(data=stats, x=Internet.users, y=Birth.rate, size = I(4), colour=Income.Group)
