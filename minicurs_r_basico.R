# MINI CURSO UERN - R STUDIO



# R COMO CALCULADORA 

2+2 
2-2
10/2
5*2

((20 + 7)/3)^2

15           /      3  
15/3

"A melhor linguagem ? R"   # CARACTERES TEM QUE ESTAR DENTRO DE ASPAS 
A melhor linguagem ? R  


# C?DIGO GRANDE USA-SE + PARA QUEBRA DE LINHA E CONTINUA??O DO COMANDO 

g1<- ggplot(Frequ?ncia, aes(x=Participa??o, y=Percentual)) +
  geom_bar(aes(fill = Participa??o), stat="identity",fill=c("#0000FF","#4682B4","#000080","#000080"))+ 
  theme_minimal() + 
  scale_y_continuous(labels = percent_format(),  limits = c(0, 0.6)) +
  labs(x= "Participa??o", y= "Percentual (%)", title="Frequ?ncia de participa??o na monitoria")+
  theme(plot.title = element_text(family="serif",size = 14, face = "bold"),
        axis.title = element_text(family="serif",size = 12, face = "bold"),
        axis.text = element_text(family="serif",size = 12))

# CRIANDO UM OBJETO, COMBINA??O DE DOIS OPERADORES: < - 


dados # VISUALIZAR OBJETO 
print (dados) # VISUALIZAR OBJETO  


# O R SABE DISTINGUIR LETRAS MAI?SCULAS E MIN?SCULAS 

dados < (1+3+5+4)
Dados 

# Em uma an?lise estat?stica existem diferentes tipos de dados: num?ricos, 
# categ?ricos, ordinais, etc. -> CLASSES 

x <- 12.5
class(x)

logico <- 2 < 3 #dois ? menor que tr?s?
class(logico)

nome <- "Dados"
class(nome)


# CRIANDO UM VETOR

dados1 <- c(1,2,3,4)
dados1

names(dados1) <-c('Janeiro','Fevereiro','Mar?o','Abril')
dados1

dados2 <- c(5,6,7,8)
names(dados2) <-c('Maio','Junho','Julho','Agosto')
dados2


a <- 1:5; b <- 3:7 
a + b #somando elemento a elemento
a - b #subtraindo elemento a elemento
a * b #multiplicando elemento a elemento
a / b #dividindo elemento a elemento
a ^ b #exponeciando elemento a elemento

# ACESSAR ELEMENTOS DO VETOR

a[5]

a[-5]  # IND?CE NEGATIVO

#OPERADORES L?GICOS 

idade <- c(34, 27, 20, 28, 32, 43, 31, 18, 45, 36)
idade > 35
summary(idade)

idade[idade > 35]  # SELECIONAR APENAS IDADES > 35


# GR?FICOS B?SICOS EM R

plot(idade)
hist(idade)
barplot(idade)

# INSERINDO T?TULOS 

plot(idade, main= "Idades dos Participantes", xlab="Quantidade", ylab="Idade", col= "red", pch=16)
hist(idade, main= "Idades dos Participantes", xlab="Quantidade", ylab="Idade", col= "blue")
barplot(idade, main= "Idades dos Participantes", xlab="Quantidade", ylab="Idade", col= "red")