import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moneyapp_speed_code/RegisterPage.dart';
import 'package:moneyapp_speed_code/main.dart';
import 'main.dart';

void main() {
  runApp(const LoginPage ());
}

class LoginPage  extends StatelessWidget {
  const LoginPage ({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Form',
      home: MyLoginPage(title: 'Login Form'),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key, required this.title});

  final String title;

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> login() async{
    if(email.text != "" || password.text!="")
    {
      try{
        String uri = "http://user.test/login_user.php";
        var res=await http.post(Uri.parse(uri), body:{
          "email": email.text,
          "password": password.text
        });
        print(res.statusCode);
        if (res.statusCode == 200) {
          print(res.body); // Print the response body
        } else {
          print("Error: ${res.reasonPhrase}"); // Print the reason phrase for non-200 status codes
        }

        var response=jsonDecode(res.body);
        print(response);
        var info = jsonEncode(response[1]);
        print(info); 
        if(response[0] == true){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeNavigationPage(0, info)),
            );

            }
        else{
          print("Амжилтгүй");
        }
      }

      catch(e){
        print(e);
      }
    }else{
      print("Бүх талбарыг бөглөнө үү баярлалаа :>");
    }
  }
 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Сайн уу Манай системд тавтай морилно уу!',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(227, 236, 156, 156),
          ),
        ),
        
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Text(
                  'Нэвтрэх мэдээлэл',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(66, 0, 0, 0),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: 'Имэйл хаяг',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Нууц үг',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  child: Text('Нэвтрэх',
                  style: TextStyle(
                    color: Color.fromARGB(255, 220, 131, 83),
                  )),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterPage()),
                    );
                  },
                  child: Text('Бүртгүүлэх'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
