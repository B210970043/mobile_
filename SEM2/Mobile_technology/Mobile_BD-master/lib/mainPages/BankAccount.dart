import 'package:flutter/material.dart';

class BankAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Account'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account Overview',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Card(
              elevation: 3.0,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account Number',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('XXXX-XXXX-XXXX-1234'),
                    SizedBox(height: 10.0),
                    Text(
                      'Balance',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('\$5,000.00'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Recent Transactions',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Replace with actual number of transactions
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Transaction Title'),
                    subtitle: Text('Date: MM/DD/YYYY'),
                    trailing: Text('-\$100.00'), // Replace with actual amount
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BankAccountScreen(),
  ));
}
