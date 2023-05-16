import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plate_pal/screen/splash_screen.dart';
import 'package:provider/provider.dart';

import 'providers/location.dart';
import 'providers/restaurants.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      /// registering the providers to be available across our app
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => RestaurantsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => LocationProvider(),
        ),
      ],

      child: MaterialApp(
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
    
        home: SplashScreen(),
    
        
      ),
    );
  }
}