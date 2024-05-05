import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moneyapp_speed_code/LoginPage.dart';
import 'main.dart';
void main() {
  runApp(const RegisterPage());
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Form',
      home: MyHomePage(title: 'Registration Form'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  Future<void> insertrecord() async{
    if(name.text != "" || email.text!="" || password.text !="")
    {
      try{
        String uri = "http://user.test/regisration_user.php";
        var res=await http.post(Uri.parse(uri), body:{
          "name": name.text,
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
        if(response["success"] == true){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
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
    return MaterialApp(
      home: Scaffold(appBar: AppBar(

        title: Text('Бүртгүүлэх'),
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: name,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Нэрээ оруулна уу!')),
          ),

        ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: email,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Имэйл хаягаа оруулна уу!')),
          ),

        ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: password,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Нууц үгээ оруулна уу!')),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              insertrecord();
            },
            child: Text('Бүртгүүлэх'),
          ),
        )
        ],),
      )
    );
  }
}
