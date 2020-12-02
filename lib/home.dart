import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgs_mobile_client/common/widgets.dart';
import 'package:lgs_mobile_client/settings/screens.dart';
import 'package:lgs_mobile_client/shopping/screens/index.dart';
import 'package:lgs_mobile_client/styles.dart';

class Home extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  List<Widget> _screens = [
    ActiveShopping(),
    MyShoppingLists(),
    Socials(),
    SettingsScreen()
  ];

  List<String> titleLists = ['Active', 'Shopping List', 'Socials', 'Settings'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Container(
                margin: EdgeInsets.only(left: 5.5),
                child: Text(titleLists[_currentIndex],
                    style: appTextOnPrimary.copyWith(
                        fontSize: 20.0, fontWeight: FontWeight.bold))),
            actions: _screens[_currentIndex] is HasActionButtons
                ? (_screens[_currentIndex] as HasActionButtons)
                    .getActionButtons(context)
                : null,
          ),
          body: IndexedStack(
            index: _currentIndex,
            children: _screens,
          ),
          bottomNavigationBar: buildBottomNavigatiom(
              _currentIndex, (index) => setState(() {
            _currentIndex = index;
          }) ),
        );
  }

  buildBottomNavigatiom(int currentIndex, void onTab(int index)) {
    return BottomNavigationBar(
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
      currentIndex: _currentIndex,
      onTap: onTab,
      type: BottomNavigationBarType.fixed,
    );
  }
}
