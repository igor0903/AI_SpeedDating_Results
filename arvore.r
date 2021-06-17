data=speedDating


attach(data)
##total 

table(match)
prop.table(table(match))
barplot(table(match), beside=TRUE, legend=TRUE,
        args.legend=list(x="top", bty="n"))
#podemos ve que nessa amostra existem muito mais pessoas que nao deram match do que sim

##idade

hist(age)
boxplot(age)
mean(age)
sd(age)
#pelo histograma podemos ve que a amostra é aproximadamente simetrica,
#apesar dos outliers que sao poucos em relação ao tamanho da amostra
#a media da idade dos estudantes na amostra é de 26 anos e o desvio padrão è 3.57
par(mfrow=c(1,2))
hist(age[match==0])
boxplot(age[match==0])
hist(age[match==1])
boxplot(age[match==1])
mean(age[match==0])
sd(age[match==0])
mean(age[match==1])
sd(age[match==1])
 

#age_o

par(mfrow=c(1,2))
hist(age_o[match==0])
boxplot(age_o[match==0])
hist(age_o[match==1])
boxplot(age_o[match==1])
mean(age_o[match==0])
sd(age_o[match==0])
mean(age_o[match==1])
sd(age_o[match==1])

#goal


table(goal)
prop.table(table(goal))

barplot(table(goal), beside=TRUE, legend=TRUE,
        args.legend=list(x="top", bty="n"))
#pela tabela o maior numero de encontros provem das pessoas que tem o bjetivo de passar uma noite divertida
#seguido das pessoas que querem conhecer pessoas novas
#e o menor numero de encontros se encontra nas pessoas que procuram um relacionamento serio


par(mfrow=c(1,1))
table(goal,match)
prop.table(table(goal,match))
barplot(table(goal,match), beside=TRUE, legend=TRUE,
        args.legend=list(x="top", bty="n"))

#no geral podemos ve que para cada categoria existem mais pessoas que não deram match
#logo podemos ve que a categoria que a pessoa se encontra não afeta o match ou não

##razao
table(goal,match)[,2]/table(goal,match)[,1]
#dividido 1/0

#podemnos ve que a categoria 1 deu mais match e a que deu menos match foi a categoria 6
#mas no geral os valores sao bem parecidos

##date
par(mfrow=c(1,2))
table(date)
prop.table(table(date))
barplot(table(date), beside=TRUE, legend=TRUE)
#pelo grafico de barras a maioria de encontros se da nas pessoas que saem para encontros 
#4 vezes por mes seguida das pessoas que que saem para encontros varias vezes por ano
#o menor numero se encontra nas pessoas que saem varias vezes por semana

##par(mfrow=c(1,1))
table(date,match)
prop.table(table(date,match))
barplot(table(date,match), beside=TRUE, legend=TRUE,
        args.legend=list(x="top", bty="n"))

#no geral podemos ve que para cada categoria existem mais pessoas que não deram match
#logo podemos ve que a categoria que a pessoa se encontra não afeta o match ou não

##razao
table(date,match)[,2]/table(date,match)[,1]

#a categoria que deu mais matchs foi a primeira, emq ue as pessoas vao a encontros
#varias vezes na semana, nesse caso, 
#se diferencia bastante das outras, porem tem uma quanrtidade pequena nesse caso



## go_out
par(mfrow=c(1,2))
table(go_out)
prop.table(table(go_out))
barplot(table(go_out), beside=TRUE, legend=TRUE,
        args.legend=list(x="top", bty="n"))
#podemos ve que a maioria de encontros se da nos individuos que saem duas vezes por semanas
#seguguido dis individuos que saem varias vezes por semana.
#o menor numero é nos individuos que quase nunca saem

table(go_out,match)
prop.table(table(go_out,match))
barplot(table(go_out,match), beside=TRUE, legend=TRUE,
        args.legend=list(x="top", bty="n"))
#no gerategoria existe um neumero maior de rejicaoem todos os casos, porem podemos observar
#que o maior numero de nao matchs se encontra na segunda categoria, os que saem duas vezes pode semana ,
#e nos match primeira categoria, que saem varias vezes por semana,

##razao
table(go_out,match)[,2]/table(go_out,match)[,1]
#podemos confirmar aqui o que foi visto anteriormente, apesar de os valores ainda serem bem proximos.
#podemos ve tbm que a amior rejeicao se encontra na categoria 7

#int_corr
hist(int_corr)
boxplot(int_corr)

#a dist dessa variavel continua é aproximadamente simetrica na amostra

hist(int_corr[match==0])
hist(int_corr[match==1])
boxplot(int_corr[match==0])
boxplot(int_corr[match==1])

mean(int_corr[match==0],na.rm=TRUE)
mean(int_corr[match==1],na.rm=TRUE)
#os dois histogramas sao aproximadamente simetricos, 
#a media dos nao matchs é de uma correlacao de 0.19 enquanto que a dos matchs é de 0.22
# tem correlacoes bem proximas, mas pelo boxplot podemos perceber que os nao matchs tem uma correlaco menor que oa matchs




##length

table(length)
prop.table(table(length))
barplot(table(length), beside=TRUE, legend=TRUE,
        args.legend=list(x="top", bty="n"))
#podemos ver que a maioria dos individuos achou a  entrevista muito curta, seguido dos que acharam adequada.
#poucos individuos acharam longa

table(length,match)
prop.table(table(length,match))
barplot(table(length,match), beside=TRUE, legend=TRUE,
        args.legend=list(x="top", bty="n"))



table(length,match)[,2]/table(length,match)[,1]
#as pessoas que dissram que a entrevista era muito longa tiveram um major indice de match
#dentre as outras duas categorias

##met
par(mfrow=c(1,1))
table(met)
prop.table(table(met))
barplot(table(met), beside=TRUE, legend=TRUE,
        args.legend=list(x="top", bty="n"))

#o numero de encontros nos quais os casais ja se conheciam é parecido com o s que nao se conheciam
table(met,match)
prop.table(table(met,match))
barplot(table(met,match), beside=TRUE, legend=TRUE,
        args.legend=list(x="top", bty="n"))
#podemos ve que no grupo dos match tem mais pessoas que se conhecem do que as que nao se conhecem,
# e dos que nap deram match tem mais pessoas que nao conheciam


table(met,match)[,2]/table(met,match)[,1]

#ao fazer a razao vimos que temos mais match quando se conhecem

##like

par(mfrow=c(1,1))
table(like)
prop.table(table(like))[-c(1,6,8,10,12,14,16,17)]
barplot(table(like))
#na amosta existem mais pessoas que  gostaram do seu par em univel 7, seguido de um nivel 6

table(like,match)[-c(1,6,8,10,12,14,16,17),]
prop.table(table(like,match))[-c(1,6,8,10,12,14,16,17),]
barplot(table(like,match)[-c(1,6,8,10,12,14,16,17),], beside=TRUE, legend=TRUE,
        args.legend=list(x="top", bty="n"))


table(like,match)[,2]/table(like,match)[,1]
#para a analise vamos ignorar os valores, 0 ,4.5 , 5.5, etc pois ocorrem pouquissimas vezes na amostra
#
#

table(like,match)[-c(1,6,8,10,12,14,16,17),][,2]/table(like,match)[-c(1,6,8,10,12,14,16,17),][,1]
#podemos ve que a a proporção de matchs é maior para os likes  a partir do 6
#um bom modo de começar a pesquisa


##prob
par(mfrow=c(1,1))
table(prob)
prop.table(table(prob))[-c(3,6,8,10,12,14,16,18)]
barplot(table(prob))
#podemos ver que a maior parte das pessoas disse que a probabilidade de o par ter gostado de si é de 5 e a menor é 0
#removendo os valores quebrados  da vizualizacao que sao muito baixos
table(prob,match)[-c(3,6,8,10,12,14,16,18),]
prop.table(table(prob,match)[-c(3,6,8,10,12,14,16,18),])
barplot(table(prob,match)[-c(3,6,8,10,12,14,16,18),], beside=TRUE, legend=TRUE,
        args.legend=list(x="top", bty="n"))
 

table(prob,match)[-c(3,6,8,10,12,14,16,18),][,2]/table(prob,match)[-c(3,6,8,10,12,14,16,18),][,1]
#podemos ve que a partir de prob = 8 temos um maior numero de matchs
##um bom inicio para o modelo 
