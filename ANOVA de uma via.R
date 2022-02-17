
# ANOVA de uma via - MEETUP R-Ladies Natal

# Passo 1: Carregar os pacotes

if(!require(dplyr)) install.packages("dplyr")
library(dplyr)                                
if(!require(RVAideMemoire)) install.packages("RVAideMemoire") 
library(RVAideMemoire)                                        
if(!require(car)) install.packages("car")   
library(car)                                
if(!require(psych)) install.packages("psych") 
library(psych)                                
if(!require(rstatix)) install.packages("rstatix") 
library(rstatix)                                
if(!require(DescTools)) install.packages("DescTools") 
library(DescTools)

# Passo 2: Carregar o banco de dados

# Importante: selecionar o diretório de trabalho (working directory)  

# manualmente: Session > Set Working Directory > Choose Directory

dados <- read.delim("clipboard",dec=",",header=T) # Carregamento do arquivo excel
View(dados)                                # Visualiza??o dos dados em janela separada
glimpse(dados)                             # Visualiza??o de um resumo dos dados


# Passo 3: verificar a normalidade dos dados
# Shapiro por grupo (pacote RVAideMemoire)
#  ~ hipóteses ~ 
#H0: distribuicao normal se p > 0,05
#H1: distribuicao nao segue padroes de normalidade se p < 0,05

byf.shapiro(ALT ~ TRAT, dados)


# Passo 4: verificar a homogeneidade de vari?ncias
# Teste de Levene (pacote car)

#H0: dados apresentam homogenidade de variancias se p > 0,05
#H1: dados nao apresentam homogenidade de variancias se p < 0,05

leveneTest(ALT ~ TRAT, dados, center=mean)


# Passo 5: verificar da presenca de outliers (por grupo) - Pacotes dplyr e rstatix

# Para ALT: (rstatix)
dados %>%   #identificar por grupo
  group_by(TRAT) %>% 
  identify_outliers(ALT)

## Pelo boxplot:
boxplot(ALT ~ TRAT, data = dados, ylab="Altura das Plantas (cm)", xlab="Tratamento")


# Passo 6: ANOVA

#H0: todos os grupos possuem m?dias iguais se p > 0,05
#H1: ha pelo menos uma diferenca entre as medias se p < 0,05

anova_ALT <- aov(ALT ~ TRAT, dados)
summary(anova_ALT)

# Passo 7:  post-hoc - (Pacote DescTools)

# Uso do TukeyHSD
PostHocTest(anova_ALT, method = "hsd", conf.level=0.95)

# Passo 8: Analise descritiva dos dados
describeBy(dados$ALT, group = dados$TRAT)

