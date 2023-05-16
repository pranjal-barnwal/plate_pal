import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plate_pal/screen/orders_screen.dart';
import 'screen/bookmarks_screen.dart';
import 'screen/filters_screen.dart';
import 'screen/profile_screen.dart';
import 'screen/home_screen.dart';

class CompleteLayout extends StatefulWidget {
  const CompleteLayout({super.key});

  @override
  State<CompleteLayout> createState() => _CompleteLayoutState();
}

class _CompleteLayoutState extends State<CompleteLayout> {
  int _currentIndex = 0;

  final List<Widget> _children = [ 
    HomeScreen(), 
    const FiltersScreen(), 
    HomeScreen(), 
    const BookmarksScreen(), 
    const ProfileScreen()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,   //? to make status-bar icons dark 
        child: Scaffold(
          // appBar: AppBar(
          //   //:?    Making StatusBar Transparent
          //   systemOverlayStyle:
          //       const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          //   toolbarHeight: 4,
          // ),
          
          body: _children[_currentIndex],

          floatingActionButton: SizedBox(
            height: 70,
            width: 70,
            child: FloatingActionButton(
              backgroundColor: const Color(0xffdc0000),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersScreen()));
              },
              child: const Icon(
                Icons.document_scanner_rounded,
                size: 36,
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            selectedItemColor: Color(0xffdc0000),
            unselectedItemColor: Color(0xffe26b6f),
            showUnselectedLabels: false,
            onTap: onTabTapped,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.window),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.filter),
                label: 'Filter',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.circle, size: 0),
                label: '',
                // onTap: null(){},  // Make it unclickable by setting onTap to null
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'Bookmark',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      );
  }
}