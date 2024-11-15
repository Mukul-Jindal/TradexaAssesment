import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tradexaassignment/Components/constants.dart';
import 'package:tradexaassignment/homePage.dart';
import 'package:tradexaassignment/provider/movieProvider.dart';

void main() {
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
      providers: [
        ChangeNotifierProvider(
          create: (context) => movieProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie Search',
        theme: ThemeData(
         scaffoldBackgroundColor: colorConstants.mainBackgroundColor,
         fontFamily: fontFamilyConstants.family
        ),
        home: const Homepage(),
      ),
    );
  }
}
