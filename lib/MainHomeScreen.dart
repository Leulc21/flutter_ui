import 'package:flutter/material.dart';
import 'package:update_flu/screen/account.dart';
import 'package:update_flu/screen/favourite.dart';
import 'package:update_flu/screen/home.dart';
import 'package:update_flu/widget/Drawer.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [Home(), Favourite(), Account()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  AppBar? _buildAppBar(int index) {
    switch (index) {
      case 1:
        return AppBar(
          title: Text("Favourite"),
          backgroundColor: Colors.white,
          elevation: 0,
        );
      case 2:
        return AppBar(
          title: Text("Account"),
          backgroundColor: Colors.white,
          elevation: 0,
        );
      default:
        return AppBar(backgroundColor: Colors.white, elevation: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 243, 1),
      appBar: _buildAppBar(_selectedIndex),
      drawer: CustomDrawerWidget(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        backgroundColor: Colors.green,
        iconSize: 30,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline, color: Colors.black),
            label: '  Fav',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.black),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
