import 'package:flutter/material.dart';
import 'mainPages/AccountPage.dart';
import 'mainPages/HomePage.dart';
import 'mainPages/transactionsPage.dart';
import 'mainPages/upcomingTransactionsPage.dart';
import 'LoginPage.dart'; // Import your login page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Determine if the user is logged in or not
  bool isLoggedIn = false; // Initially set to false
  String info = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      // Check if user is logged in, if yes, show HomeNavigationPage,
      // otherwise show LoginPage
      home: isLoggedIn ? HomeNavigationPage(0, info) : LoginPage(),
    );
  }
}

class HomeNavigationPage extends StatefulWidget {
  HomeNavigationPage(this.currentIndex, this.info);
  int currentIndex;
  final String info;
  
  @override
  State<HomeNavigationPage> createState() => _HomeNavigationPageState();
}

class _HomeNavigationPageState extends State<HomeNavigationPage> {
  late List<Widget> screens; // Declare screens as a late variable
  @override
  void initState() {
    super.initState();
    // Initialize screens after widget is fully initialized
    screens = [
      HomePage(info: widget.info),
      TransactionPage(),
      PastTransactionsPage(),
      AccountPage(info: widget.info),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: IndexedStack(
          index: widget.currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedItemColor: const Color.fromARGB(255, 251, 251, 251),
          currentIndex: widget.currentIndex,
          onTap: (index) => setState(() {
            widget.currentIndex = index;
          }),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.money), label: "Upcoming"),
            BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: "Past"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
          ],
        ));
  }
}