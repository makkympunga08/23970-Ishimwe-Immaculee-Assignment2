import 'package:flutter/material.dart';
import 'signin.dart';
import 'signup.dart';
import 'calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.green, // Changed the primary color
        textTheme: TextTheme(
            // Changed the font text
            //bodyText1: TextStyle(
            //  fontFamily: 'Roboto',
            //color: Colors.black), // Changed font color to black
            // bodyText2: TextStyle(fontFamily: 'Roboto', color: Colors.black),
            ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    SignInScreen(),
    SignUpScreen(),
    CalculatorScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'MENU',
            style: TextStyle(
                color: Colors.white), // Changed the font color of the title
          ),
          backgroundColor: Color.fromARGB(255, 175, 135, 76)),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_open), // Changed icon
            label: 'Sign In',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add_alt), // Changed icon
            label: 'Sign Up',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined), // Changed icon
            label: 'Calculator',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[800], // Changed selected item color
        unselectedItemColor: Colors.blueGrey, // Changed unselected item color
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green, // Changed drawer header color
              ),
              child: Text(
                'ISHIMWE IMMACULEE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Roboto', // Changed font family
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.lock_open), // Changed icon
              title: Text('Sign In'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.person_add_alt), // Changed icon
              title: Text('Sign Up'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.calculate_outlined), // Changed icon
              title: Text('Calculator'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(2);
              },
            ),
          ],
        ),
      ),
    );
  }
}
