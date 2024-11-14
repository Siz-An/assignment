import 'package:flutter/material.dart';
import 'package:pos/navpages/profile.dart';
import 'package:pos/navpages/setting.dart';
import 'package:pos/navpages/store.dart';
import 'homepage.dart';

class Navbar extends StatefulWidget {
  @override
  _MyNavBarState createState() => _MyNavBarState();
}

class _MyNavBarState extends State<Navbar> {
  // The index to track the selected page in the navigation bar
  int _selectedIndex = 0;

  // The pages to navigate to
  final List<Widget> _pages = [
    HomePage(),
    StorePage(),
    SettingsPage(),
    ProfilePage(),
  ];

  // The function to handle bottom navigation item changes
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Track the current selected index
        onTap: _onItemTapped, // Callback to update the selected index
        backgroundColor: Colors.black, // Custom background color for the nav bar
        selectedItemColor: Colors.redAccent, // Color of the selected item
        unselectedItemColor: Colors.grey, // Color of the unselected items
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
