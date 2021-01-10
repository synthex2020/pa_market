import 'package:flutter/material.dart';
import 'package:pa_market/aboutFarms/browser.dart';
import 'package:pa_market/account/accountSettings.dart';
import 'package:pa_market/home/home.dart';

class NavigationBar extends StatefulWidget {
  int selectedIndex;
  NavigationBar({this.selectedIndex});
  @override
  _NavigationBarState createState() => _NavigationBarState(selectedIndex: selectedIndex);
}

class _NavigationBarState extends State<NavigationBar> {

  int selectedIndex;
  _NavigationBarState({this.selectedIndex});
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Farms', style: optionStyle,),
    Text('Index 1: Farmers', style: optionStyle,),
    Text('Index 2: Account', style: optionStyle,)
  ];
  
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if(index == 0) {
        //go to farms home
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
        print("zero");
      }else if (index == 1){
        //go to their social about pages
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Browser()));
      }else{
        //its the user account
        Navigator.push(context, MaterialPageRoute(builder: (context)=> AccountSettings()));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.agriculture), label: 'Farms'),
      BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'Browser'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
    ],
      currentIndex: selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
