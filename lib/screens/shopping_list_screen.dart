import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lgs_mobile_client/styles.dart';

class ShoppingListScreen extends StatelessWidget {
  static const routeName = '/shopping_lists';

  @override
  Widget build(BuildContext context) => _ShoppingListScreen();
}

class _ShoppingListScreen extends StatefulWidget {
  @override
  _ShoppingListScreenState createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<_ShoppingListScreen> {
  int _selectedIndex = 1;

  static final List<Widget> _screens = <Widget>[
    _ActiveShopping(),
    _MyShoppingLists(),
    _Socials(),
    _Settings()
  ];

  _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Lets Go Shopping", style: appTextOnPrimary)),
      ),
      body: Center(
        child: _screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.play_circle_fill,
              ),
              label: "Active"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt,
            ),
            label: "List",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.people_alt,
              ),
              label: "Social"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: "Settings"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        backgroundColor: lgsPrimaryColour,
        selectedItemColor: Colors.black26,
        selectedIconTheme: IconThemeData(color: Colors.black),
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 16,
      ),
    );
  }
}

class _ActiveShopping extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Active sales'),
    );
  }
}

class _MyShoppingLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('My Shopping Lists'),
    );
  }
}

class _Socials extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Social screens'),
    );
  }
}

class _Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('settings'),
    );
  }
}
