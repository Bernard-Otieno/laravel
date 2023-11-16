# -*- coding: utf-8 -*-
"""

@author: Bernard
"""


# data
DATA_PATH = 'creditcard.csv'

RANDOM_SEED = 101
# target
TARGET = 'Class'

# input features
FEATURES = ['Time','Amount']

# to-be-scaled feature
SCALING_FEATURE = ['Amount']

# model
ESTIMATOR_SIZE = 100
MODEL_PATH = 'rf_model.h5'
ENCODER_PATH = 'scaler.pkl'
PIPELINE_NAME = 'rf_pipe.pkl'
CLASSES_PATH = 'classes.pkl'