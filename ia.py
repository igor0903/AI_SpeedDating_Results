# -*- coding: utf-8 -*-
"""Trabalho IA


Original file is located at
    https://colab.research.google.com/drive/1cJCP9jdGZqVZSlbZaZihddTncsg8Rybp

# Dados
"""

import numpy as np
import pandas as pd
data=pd.read_csv("speedDating_trab.csv", sep=",")

#retirando a primeira coluna undefined
data=pd.DataFrame(data=data.iloc[:,1:14].values,columns=data.columns[1:14])

print(data)

"""Descrição dos dados"""

data.describe()

"""Substituição dos valores nulos pelo: valor inteiro da média dos seus valores em age e age_o, o int_corr é substituido pelo seu valor float com duas casas decimais e as variaveis categoricas sao substituidas pela sua moda. **substituir os valores quebrados da variavel like e probs para nao termos um modelo muito overthinngk comparar ma verdade**"""

dataC=data.copy()


for col in dataC.columns:
  if(col!='id' and col!='partner'):
      if(col=='int_corr'):
         dataC[col]=dataC[col].replace(np.nan,round(dataC[col].mean(),2))
      if(col=='age' or col=='age_o'):
         dataC[col]=dataC[col].replace(np.nan,float(int(dataC[col].mean())))
      else:
         dataC[col]=dataC[col].replace(np.nan,float(int(dataC[col].mode())))
         


data=dataC.copy()

print(data.info())

"""Nova descrição dos dados"""

data.describe()

"""# Analise dos dados (no R)



"""

#from google.colab import files
#data.to_csv('speedDating.csv',index = False, header = True)
#files.download('speedDating.csv')

"""# Preparação dos dados

Separação entre atributos e objetivos
"""

x=data.drop(columns=['id','partner','match'])
y=data['match']

"""30% dos dados para teste e 70% para treino"""

from sklearn.model_selection import train_test_split
#random state para fixar uma divisão dos dados
x_train,x_test,y_train,y_test=train_test_split(x,y,test_size=0.3,random_state=9)

"""# Criando modelos CART

Sem pré prunning
"""

from sklearn import tree
from sklearn.tree import DecisionTreeClassifier
import matplotlib.pyplot as plt

model_SP=DecisionTreeClassifier(criterion='gini',random_state=9)
model_SP.fit(x_train,y_train)
#fig, axes = plt.subplots(nrows = 1,ncols = 1,figsize = (4,4), dpi=300)
#tree.plot_tree(model_SP,feature_names=x.columns,class_names=["0","1"],filled=True)
#fig.savefig('arvore_SP.png')

predictions_cart_SP=model_SP.predict(x_test)

"""Analise CART prunning: verificar qual melhor altura da arvore"""

from sklearn.metrics import accuracy_score
from sklearn.metrics import precision_score, recall_score
from sklearn.metrics import f1_score
scorem=0
isc=0
precisionm=0
ip=0
recallm=0
ir=0

for i in range(1,1200):
  model_i=DecisionTreeClassifier(criterion='gini',max_depth=i,random_state=9)
  model_i.fit(x_train,y_train)
  predictions_cart_i=model_i.predict(x_test)
  score=accuracy_score(y_test, predictions_cart_i)
  precision=precision_score(y_test,predictions_cart_i,labels=[1,0])
  recall=recall_score(y_test,predictions_cart_i,labels=[1,0])
  
  if(score>scorem):
    scorem=score
    isc=i
  if(precision>precisionm):
    precisionm=precision
    ip=i
  if(recall>recallm):
    recallm=recall 
    ir=i
  
print("melhor score: altura ",isc," melhor precision: altura ",ip)

"""com pre prunnig"""

model=DecisionTreeClassifier(criterion='gini',max_depth=18,random_state=9)
model.fit(x_train,y_train)
#fig, axes = plt.subplots(nrows = 1,ncols = 1,figsize = (4,4), dpi=300)
#tree.plot_tree(model,feature_names=x.columns,class_names=["0","1"],filled=True)
#fig.savefig('arvore.png')

"""Ver arvore"""

predictions_cart=model.predict(x_test)

"""# Naive Bayes"""

from sklearn.naive_bayes import GaussianNB
clf = GaussianNB()
clf.fit(x_train, y_train)
predictions_naive= clf.predict(x_test)

"""# Avaliação

Accurracy
"""

from sklearn.metrics import accuracy_score


score_cart_SP=accuracy_score(y_test, predictions_cart_SP)
print("accuracy cart s/p",score_cart_SP*100)

score_cart=accuracy_score(y_test, predictions_cart)
print("accuracy cart c/p",score_cart*100)

score_naive=accuracy_score(y_test, predictions_naive)
print("accuracy naive bayes",score_naive*100)

"""# dummy """

from sklearn.dummy import DummyClassifier
clf = DummyClassifier(strategy='most_frequent', random_state=0)
clf.fit(x_train, y_train)
DummyClassifier(random_state=9, strategy='most_frequent')
clf.score(x_test, y_test)*100

"""Matriz de confusão,precision e recall

CART s/prunning
"""

from sklearn.metrics import confusion_matrix
confusion_matrix_cart_SP=confusion_matrix(y_test, predictions_cart_SP,labels=[1,0])
confusion_matrix_cart_SP

from sklearn.metrics import precision_score, recall_score
print("precision ",precision_score(y_test,predictions_cart_SP,labels=[1,0])*100)
print("recall ",recall_score(y_test,predictions_cart_SP,labels=[1,0])*100)

"""CART c/ prunning"""

confusion_matrix_cart=confusion_matrix(y_test, predictions_cart,labels=[1,0])
confusion_matrix_cart

print("precision ",precision_score(y_test,predictions_cart,labels=[1,0])*100)
print("recall ",recall_score(y_test,predictions_cart,labels=[1,0])*100)

"""Naive Bayes"""

confusion_matrix_naive=confusion_matrix(y_test, predictions_naive,labels=[1,0])
confusion_matrix_naive

print("precision ",precision_score(y_test,predictions_naive,labels=[1,0])*100)
print("recall ",recall_score(y_test,predictions_naive,labels=[1,0])*100)

"""# Score F1"""

from sklearn.metrics import f1_score
print("score f1 cart s/p ",f1_score(y_test,predictions_cart_SP))
print("score f1 cart c/p ",f1_score(y_test,predictions_cart))
print("score f1 naive bayes ",f1_score(y_test,predictions_naive))