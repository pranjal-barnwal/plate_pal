import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screen/bookmarks_screen.dart';
import 'screen/filters_screen.dart';
import 'screen/profile_screen.dart';
import 'screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _children = [ const HomeScreen(), const FiltersScreen(), const BookmarksScreen(), const ProfileScreen()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splitted Widgets',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.red,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey.shade800,
          ),
          displayMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey.shade700,
          ),
        ),
      ),

      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,   //? to make status-bar icons dark 
        child: Scaffold(
          // appBar: AppBar(
          //   //:?    Making StatusBar Transparent
          //   systemOverlayStyle:
          //       const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          //   toolbarHeight: 4,
          // ),
          
          body: _children[_currentIndex],
          
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
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
                icon: Icon(Icons.bookmark),
                label: 'Bookmark',
              ),
              // const BottomNavigationBarItem(
              //   icon: Icon(Icons.person),
              //   label: 'Person',
              // ),
            ],
          ),
        ),
      ),

      
    );
  }
}