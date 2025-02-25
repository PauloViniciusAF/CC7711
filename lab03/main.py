#pip install 
#pip install matplotlib
#pip install pandas

import pandas as pd
import numpy as np
from sklearn import tree, metrics
from sklearn.tree import DecisionTreeClassifier
import matplotlib.pyplot as plt
from scipy.io import arff


data = pd.read_csv(".\jogadores.csv", sep = ',', encoding="UTF-8")

print(data.drop(data.columns[1], axis=1))
#attributes = meta.names()
data_value = np.asarray(data)


preco = np.asarray(data['preco']).reshape(-1,1)
media = np.asarray(data['media']).reshape(-1,1)
gols = np.asarray(data['gols']).reshape(-1,1)

features = np.concatenate((preco, media, gols),axis=1)
target = data['resultado']


Arvore = DecisionTreeClassifier(criterion='entropy').fit(features, target)

plt.figure(figsize=(10, 6.5))
tree.plot_tree(Arvore,feature_names=['preco','media','gols'],class_names=['Bom', 'Ruim'],
                   filled=True, rounded=True)
plt.show()

fig, ax = plt.subplots(figsize=(25, 10))
metrics.ConfusionMatrixDisplay.from_estimator(Arvore,features,target,display_labels=['Bom', 'Ruim'], values_format='d', ax=ax)
plt.show()