#################################################################
### Introdução à Estatística para Linguística, v2.0, fev/2021 ###
######                     L. Oushiro                      ######
######          Lição 12: Regressão Linear Parte 1         ######
######                  Lista de Exercícios                ######
#################################################################

## Para responder as questões abaixo, você precisará do arquivo de dados da planilha Pretonicas.csv. Se não tiver esse arquivo de dados, refaça a Lição 6 do curso Introducao a Estatistica para Linguistas - Estatistica Descritiva de Variaveis Numericas Medidas de Tendencias Centrais.

pretonicas <- read_csv("Pretonicas.csv",
                       col_types = cols(.default = col_factor(),
                                        VOGAL = col_factor(levels = c("i", "e", "a", "o", "u")),
                                        F1 = col_double(),
                                        F2 = col_double(),
                                        F1.NORM = col_double(),
                                        F2.NORM = col_double(),
                                        F1.SIL.SEG = col_double(),
                                        F2.SIL.SEG = col_double(),
                                        F1.SEG.NORM = col_double(),
                                        F2.SEG.NORM = col_double(),
                                        DIST.TONICA = col_double(),
                                        Begin.Time.s = col_double(),
                                        End.Time.s = col_double(),
                                        Duration.ms = col_double(),
                                        IDADE = col_integer(),
                                        IDADE.CHEGADA = col_integer(),
                                        ANOS.SP = col_integer()
                       )
)

pretonicas$CONT.PREC <-  fct_collapse(pretonicas$CONT.PREC,
                                      dental.alveolar = c("t", "d", "n", "l"),
                                      labial = c("p", "b", "m", "f", "v"),
                                      palatal.sibilante = c("S", "Z", "L", "s", "z"),
                                      velar = c("k", "g"),
                                      vibrante = c("h", "R")
)

pretonicas$CONT.PREC <- fct_relevel(pretonicas$CONT.PREC, "dental.alveolar", "labial", "palatal.sibilante", "velar", "vibrante")

pretonicas$CONT.SEG <- fct_collapse(pretonicas$CONT.SEG,
                                    dental.alveolar = c("t", "d", "n", "l"),
                                    labial = c("p", "b", "m", "f", "v"),
                                    palatal.sibilante = c("S", "Z", "L", "N", "s", "z"),
                                    velar = c("k", "g"),
                                    vibrante = c("r", "h", "R")
)

pretonicas$CONT.SEG <- fct_relevel(pretonicas$CONT.SEG, "dental.alveolar", "labial", "palatal.sibilante", "velar", "vibrante")

### Criar subconjunto de dados da vogal /e/ pretônica
VOGAL_o <- filter(pretonicas, VOGAL == "o") %>%
  droplevels()


#(Q1) Há quantos dados de vogal /o/ pretônica na planilha Pretonicas.csv?


###Recodifique os dados das variáveis CONT.PREC e CONT.SEG com os mesmos critérios da recodificação para a vogal /e/ (p/Q2-Q3)
#(Q2) Há quantos dados de vibrantes no contexto seguinte à vogal pretônica /o/?
#(Q3) Há quantos dados de consoantes labiais no contexto precedente à vogal pretônica /o/?

with(VOGAL_o, table(CONT.SEG))
with(VOGAL_o, table(CONT.PREC))

#(Q4) Crie um modelo linear para testar de há correlação entre a altura da vogal pretônica (F1.NORM) e a origem do falante (AMOSTRA). Há diferença significativa entre paraibanos e paulistanos quanto à sua realização da vogal pretônica /o/?
modelo <- lm(F1.NORM ~ AMOSTRA, data = VOGAL_o)
summary(modelo)
#(Q5) Neste modelo, a distribuição dos resíduos segue a distribuição normal?
shapiro.test(modelo$residuals)

#(Q6) Faça um boxplot da distribuição de F1.NORM por AMOSTRA. Se existem valores atípicos, parece adequado excluir dados cujas medidas de F1.NORM estão acima de qual ponto? 
#450 Hz; 
#550 Hz; 
#600 Hz;
#não há valores atípicos

ggplot(VOGAL_o, aes(x = AMOSTRA, y = F1.NORM)) + 
  geom_boxplot(notch = T) +
  scale_y_reverse()

#(Q7) Faça um novo subconjunto de dados incluindo apenas aqueles que estão abaixo do limite estipulado na questão anterior. Quantos dados foram efetivamente excluídos?

VOGAL_o2 <- filter(VOGAL_o, F1.NORM < 550)

#(Q8) Refaça a análise para verificar se há correlação entre F1.NORM e AMOSTRA. A nova distribuição de resíduos segue a distribuição normal?

modelo2 <- lm(F1.NORM ~ AMOSTRA, data = VOGAL_o2)
summary(modelo2)
shapiro.test(modelo2$residuals)

#(Q9) Faça um gráfico de efeitos do modelo acima. Há sobreposição entre os níveis dos intervalos de confiança da variável AMOSTRA?
plot(effect("AMOSTRA", modelo2), ylim = c(450, 400), grid = T)

#(Q10) Crie um modelo que testa se há correlação entre a altura da vogal /o/ pretônica (F1.NORM) e o contexto precedente à vogal (CONT.PREC). Entre quais níveis da variável CONT.PREC há diferença significativa?
#entre labial e dental.alveolar;
#entre palatal.sibilante e labial
#entre velar e palatal.sibilante;
#entre vibrante e labial;

modelo3 <- lm(F1.NORM ~ CONT.PREC, data = VOGAL_o2)
summary(modelo3)
TukeyHSD(aov(modelo3)) 

#(Q11) Em quantos Hz a estimativa de F1.NORM para vibrante difere da estimativa do nível de referência?

#(Q12) Qual é a medida média de F1.NORM para a vogal /o/ quando é precedida por uma consoante vibrante?

#(Q13) O quanto da variação em F1.NORM é explicado pela variável CONT.PREC?


#(Q14) Teste se há interação entre as variáveis AMOSTRA e CONT.PREC. Neste modelo, há interação entre AMOSTRA e CONT.PREC?

modelo4 <- lm(F1.NORM ~ AMOSTRA * CONT.PREC, data = VOGAL_o2)
summary(modelo4)

#(Q15) Qual é a medida média de F1.NORM para a vogal /o/ quando precedida de consoante velar na fala de paraibanos?

#(Q16) Qual é a medida média de F1.NORM para a vogal /o/ quando precedida de consoante labial na fala de paulistanos?

#(Q17) Crie um modelo para testar se há correlação entre a altura da vogal /o/ pretônica (F1.NORM) e a altura da vogal da sílaba seguinte (F1.SEG.NORM). A cada unidade de F1.SEG.NORM, em quanto se modifica a estimativa de F1.NORM?
modelo5 <- lm(F1.NORM ~ F1.SEG.NORM, data = VOGAL_o2)
summary(modelo5)

#(Q18) Calcule a estimativa da medida de F1.NORM quando F1.SEG.NORM tem 450 Hz.




###(As questões 19-21 independem de script)




