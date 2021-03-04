#################################################################
### Introdução à Estatística para Linguística, v2.0, fev/2021 ###
######                     L. Oushiro                      ######
######         Lição 15: Regressão Logística Parte 2       ######
######                  Lista de Exercícios                ######
#################################################################

#Primeiro, carregue os dados da planilha LabovDS.csv. Se você não tiver uma cópia, refaça a Lição 4 do curso Introducao a Estatistica para Linguistas. Após carregar o dataframe, cheque sua estrutura, como de praxe. Exclua os dados de `d` da variável `r`. Certifique-se de que o nível de referência é r1 -- para que os resultados de regressão logística sejam lidos em referência ao apagamento de /r/ (r0). Reorganize os níveis da variável store de acordo com o prestígio das lojas: Klein, Macys e Saks.

#(1) Verifique se há interações entre essas três variáveis em modelos simples de regressão logística, que incluem apenas uma interação."


#Entre qual par de variáveis há interação?
#store e emphasis;
#store e word;
#emphasis e word;
#nenhum


#(2) Crie um modelo com todas as variáveis. Inclua a interação, se houver. Qual variável não apresenta correlação significativa com a pronúncia de /r/?


#(3) Qual é o índice C deste modelo?


#(4) Qual é o valor de R^2 deste modelo?"


#(5) Este modelo, como um todo, é significativo?


#(6) Os funcionários de qual loja mais favorecem o apagamento de /r/?


#(7) Qual item lexical mais favorece o apagamento de /r/?


#(8) Calcule a probabilidade (de 0% a 100%) de se realizar o apagamento de /r/ na palavra `fourth`.


#(9) Acima se testou se há interações. Teste se há colinearidade entre as variáveis previsoras.
#não há;
#há entre store e emphasis;
#há entre store e word;
#há entre emphasis e word


#(10) Neste conjunto de dados, que tipo de variável é word?
#variável fixa;
#variável aleatória

