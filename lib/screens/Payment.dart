import 'package:flutter/material.dart';
import 'package:shopsmart/screens/Rating.dart';

class SimplePaymentWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController cardNumber = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController expiry = TextEditingController();
  final TextEditingController cvv = TextEditingController();

  static String id = "/pay";
  SimplePaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: const EdgeInsets.only(top: 200),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Payment",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),

                // Card Number
                TextFormField(
                  controller: cardNumber,
                  decoration: const InputDecoration(
                    labelText: "Card Number",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter card number";
                    }
                    if (value.length < 12) {
                      return "Invalid card number";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                // Name
                TextFormField(
                  controller: name,
                  decoration: const InputDecoration(
                    labelText: "Name on Card",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter name";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                Row(children: [
                  Expanded(
                    child: TextFormField(
                      controller: expiry,
                      decoration: const InputDecoration(
                        labelText: "MM/YY",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter expiry date";
                        }

                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: cvv,
                      decoration: const InputDecoration(
                        labelText: "CVV",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter CVV";
                        }
                        if (value.length != 3) {
                          return "CVV must be 3 digits";
                        }
                        return null;
                      },
                    ),
                  ),
                ]),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // add all data
                        Navigator.pushNamed(context, RatingWithButton.id);
                      }
                    },
                    child: const Text("Pay Now"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
