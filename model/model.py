from __future__ import print_function

import sys
import warnings

warnings.filterwarnings('ignore')
import numpy as np
import pickle
np.random.seed(2)

with open('rf_pipe.pkl', 'rb') as f:
    fm = pickle.load(f)
    data = np.array([[sys.argv[1],sys.argv[2]]])
    prediction = fm.predict(data)
    print(prediction)

