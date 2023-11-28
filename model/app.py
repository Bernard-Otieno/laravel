from flask import Flask, request
from flask_restful import Resource, Api
import pickle
import pandas as pd
from flask_cors import CORS

app = Flask(__name__)
CORS(app)
api = Api(app)

class Prediction(Resource):
    def post(self):
        data = request.get_json()

        # Extract the values from the JSON payload
        step_val = data.get('step')
        type_val = data.get('type')
        amount = data.get('amount')
        old_balance_org = data.get('sender_old_balance')
        new_balance_orig = data.get('sender_new_balance')
        recipient_old_balance = data.get('recipient_old_balance')
        recipient_new_balance = data.get('recipient_new_balance')

            # Check if any value is None before converting to integers
        if None in (step_val, type_val, amount, old_balance_org, new_balance_orig, recipient_old_balance, recipient_new_balance):
            return "One or more required fields are missing or contain None values", 400

        # Now convert to integers
        features = [
            int(step_val), int(type_val), int(amount), int(old_balance_org), int(new_balance_orig),
            int(recipient_old_balance), int(recipient_new_balance)
        ]

        # Create a DataFrame with the input features
        df = pd.DataFrame([features], columns=[
            'step','type', 'amount', 'oldbalanceOrg', 'newbalanceOrig',
            'oldbalanceDest', 'newbalanceDest'
        ])

        # Load the model
        model = pickle.load(open('my_model.pkl', 'rb'))

        # Make a prediction
        prediction = model.predict(df)
        prediction = int(prediction[0])

        return str(prediction)

api.add_resource(Prediction, '/prediction')  # Define the endpoint for prediction

if __name__ == '__main__':
    app.run(debug=True)
#df.replace(to_replace = ['PAYMENT', 'TRANSFER', 'CASH_OUT', 'DEBIT', 'CASH_IN'], 
# value = [2,4,1,5,3],inplace = True)