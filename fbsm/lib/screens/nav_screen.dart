import 'package:fbsm/screens/screen.dart';
import 'package:fbsm/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    HomeScreen(),
    Scaffold(),
  ];
  final List<IconData> _icons  = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellAlertOutline,
    Icons.menu,
  ];
int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _icons.length,
        child: Scaffold(
          body: IndexedStack(children: _screens,index: _selectedIndex,),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom:12.0),
            child: CustomTabBar(
              icons : _icons,
              selectedIndex : _selectedIndex,
              onTap : (index) {
                setState(() {
                  _selectedIndex = index;
                });
              }
            ),
          ),
        ));
  }
}
