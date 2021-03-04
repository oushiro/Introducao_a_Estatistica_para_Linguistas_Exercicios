#################################################################
### Introdução à Estatística para Linguística, v2.0, fev/2021 ###
######                     L. Oushiro                      ######
######         Lição 14: Regressão Logística Parte 1       ######
######                  Lista de Exercícios                ######
#################################################################

## Carregar os dados da planilha DadosRT.csv. Se você não tiver uma cópia, refaça a Lição 1 do curso Introducao a Estatistica para Linguistas -- Fundamentos. Certifique-se de que 'retroflexo' é o segundo nível da VD, e organize variáveis ordinais em ordem lógica, de menor para maior. Para a variável REGIAO, defina a região central como o primeiro nível.


#(1) Faça um modelo de regressão logística para testar se há correlação entre a pronúncia de /r/ em coda (VD) e a posição da sílaba com /r/ na palavra (POSICAO.R). Use tanto a funcao glm() quanto lrm() para responder as questoes. Há correlação significativa entre POSICAO.R e VD?


#(2) A qual nível de POSICAO.R se refere o coeficiente linear (Intercept)?


#(3) A probabilidade de empregar retroflexo quando está no meio da palavra é ..."
#menor do que quando está no final da palavra;
#maior do que quando está no final da palavra



#(4) Qual é o valor de índice C do modelo VD ~ POSICAO.R?"


#(5) De acordo com a classificação de Hosmer & Lemeshow (2000, apud Levshina 2015:259), tal índice C tem..."
#pouco poder de discriminação de resultado;
#poder aceitável de discriminação de resultado;
#poder excelente de discriminação de resultado;
#poder notório de discriminação de resultado


#(6) Faça um modelo para testar se há correlação entre a pronúncia variável de /r/ em coda (VD) e a ESCOLARIDADE do falante. De acordo com o resultado deste modelo, não há diferença significativa entre quais níveis?"


#(7) Em relação aos falantes menos escolarizados, os falantes com nível superior de escolaridade tendem a empregar mais ou menos retroflexo?"


#(8) Transforme a medida de logodds da estimativa de emprego de retroflexo para falantes com nível superior para a medida de probabilidade (= proporção de 0% a 100%). Qual é a probabilidade de emprego de retroflexo para esses falantes?"


#(9) Faça um modelo para testar se há correlação entre a pronúncia variável de /r/ em coda (VD) e a IDADE do falante. A partir dele, calcule a estimativa, em logodds, de um falante com 50 anos de idade empregar o retroflexo."


#(10) Tranforme o valor de logodds calculado em (9) para um valor de probabilidade."


#Na lição corresponde a esta lista, verificamos a interação entre FAIXA.ETARIA e REGIAO de residência do falante. A variável IDADE nada mais é do que a variável FAIXA.ETARIA vista de modo contínuo. Faça um modelo para testar a interação entre IDADE e REGIAO quanto ao uso variável de /r/ em coda. 


#(11) Há interação entre essas variáveis?"


#(12) Calcule a probabilidade, em logodds, de um falante de 30 anos que mora na região central empregar o retroflexo.


#(13) Calcule a probabilidade, em logodds, de um falante de 30 anos que mora na região periférica empregar o retroflexo.


#(14) Transforme esta última medida de logodds em probabilidade."


#(15) Faça um gráfico de efeitos da interação entre IDADE e REGIAO para checar se a medida de probabilidade calculada acima corresponde à estimativa do modelo.

