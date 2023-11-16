from flask import Flask, request
from flask_restful import Resource, Api
import pickle
import pandas as pd
from flask_cors import CORS

app = Flask(__name__)
CORS(app)
api = Api(app)

class prediction(Resource):
    def get(self, type, amount,  oldbalanceOrg, newbalanceOrig):
        # Convert input features to integers
        features = [int(type), int(amount), int(oldbalanceOrg), int(newbalanceOrig)]

        # Create a DataFrame with the input features
        df = pd.DataFrame([features], columns=['type', 'amount', 'oldbalanceOrg', 'newbalanceOrig'])

        # Load the model
        model = pickle.load(open('my_model.pkl', 'rb'))

        # Make a prediction
        prediction = model.predict(df)
        prediction = int(prediction[0])

        return str(prediction)

class GetData(Resource):
    def get(self):
        df = pd.read_csv('data.csv')
        res = df.to_json(orient='records')
        return res

api.add_resource(GetData, '/api')
api.add_resource(prediction, '/prediction/<int:type>/<int:amount>/<int:oldbalanceOrg>/<int:newbalanceOrig>')

if __name__ == '__main__':
    app.run(debug=True)
