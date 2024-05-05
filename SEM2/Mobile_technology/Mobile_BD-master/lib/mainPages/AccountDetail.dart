import 'package:flutter/material.dart';

class AccountDetailScreen extends StatelessWidget {
  final Map<String, dynamic> userInfo;
  
  // Constructor to receive user info
  AccountDetailScreen({required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Хэрэглэгчийн дэлгэрэнгүй'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Хэрэглэгчийн мэдээлэл',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            ListTile(
              title: Text('Нэр:'),
              // Accessing user info
              subtitle: Text(userInfo['u_name']),
            ),
            ListTile(
              title: Text('Имэйл хаяг:'),
              subtitle: Text(userInfo['u_email']),
            ),
            ListTile(
              title: Text('Нууц үг'),
              subtitle: Text(userInfo['u_password']),
            ),
            Divider(),
            Text(
              'Хэрэглэгчийн төлөв',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            ListTile(
              title: Text('Хэрэглэгчийн түвшин:'),
              subtitle: Text('Мөнгөн хэрэглэгч'),
            ),
            ListTile(
              title: Text('Хэрэглэгчийн одоогийн төлөв:'),
              subtitle: Text('идэвхитэй'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  // Sample user info
  Map<String, dynamic> userInfo = {
    'u_name': 'John Doe',
    'u_email': 'johndoe@example.com',
    'u_password': '+1234567890',
  };

  runApp(MaterialApp(
    home: AccountDetailScreen(userInfo: userInfo), // Pass user info to AccountDetailScreen
  ));
}
