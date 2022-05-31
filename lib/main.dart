import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  /*WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          errorColor: Colors.redAccent,
          primarySwatch: Colors.purple,
          accentColor: Colors.teal[400],
          fontFamily: "NotoSerif",
          textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: const TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )),
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                  fontSize: 20))),
      home: MyHomePage(),
    );
  }
}
