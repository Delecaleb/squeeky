import 'package:flutter/material.dart';

class CardDetailsScreen extends StatefulWidget {
  @override
  _CardDetailsScreenState createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends State<CardDetailsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? cardNumber;
  String? expiryDate;
  String? cvv;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Card Number'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid card number';
                  }
                  // Implement your card number validation logic here
                  // Example: Check if it's a valid credit card number
                  return null; // Return null for valid input
                },
                onSaved: (value) {
                  cardNumber = value;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Expiry Date (MM/YY)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid expiry date';
                  }
                  // Implement your expiry date validation logic here
                  return null; // Return null for valid input
                },
                onSaved: (value) {
                  expiryDate = value;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'CVV'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid CVV';
                  }
                  // Implement your CVV validation logic here
                  return null; // Return null for valid input
                },
                onSaved: (value) {
                  cvv = value;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Form is valid, handle the card details here
                    // Implement your card validation and processing logic here
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
