#pip install 
#pip install matplotlib
#pip install pandas

import pandas as pd
import numpy as np
from sklearn import tree, metrics
from sklearn.tree import DecisionTreeClassifier
import matplotlib.pyplot as plt
from scipy.io import arff


data,meta = arff.loadarff('./CriterioProvas.arff')

attributes = meta.names()
data_value = np.asarray(data)


percFalta = np.asarray(data['PercFalta']).reshape(-1,1)
P1notas = np.asarray(data['P1']).reshape(-1,1)
P2notas = np.asarray(data['P2']).reshape(-1,1)

features = np.concatenate((P1notas, P2notas, percFalta),axis=1)
target = data['resultado']


Arvore = DecisionTreeClassifier(criterion='entropy').fit(features, target)

plt.figure(figsize=(10, 6.5))
tree.plot_tree(Arvore,feature_names=['P1notas','P2notas','PercFalta'],class_names=['Bom', 'Ruim'],
                   filled=True, rounded=True)
plt.show()


fig, ax = plt.subplots(figsize=(25, 10))
metrics.ConfusionMatrixDisplay.from_estimator(Arvore,features,target,display_labels=['Bom', 'Ruim'], values_format='d', ax=ax)
plt.show()