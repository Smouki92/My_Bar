import 'package:flutter/material.dart';
import 'package:my_bar/widgets/cocktails_list/cocktails_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;
  static const List<Widget> _widgetOptions = <Widget>[
        CocktailsListWidget(),
    Text(
      'My drinks',
    ),
    Text(
      'Assistant',
    ),
  ];

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            label: 'Cocktails',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_bar_sharp),
            label: 'My drinks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Assistant',
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
