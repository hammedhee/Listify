import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:listify/model/grafModel.dart';
import 'package:listify/model/groceryList.dart';
import 'package:listify/model/userdataModel.dart';
//import 'package:listify/model/userdataModel.dart';
import 'package:listify/view/helppage.dart';
import 'package:listify/view/homescreen.dart';
import 'package:listify/view/loginpage.dart';
import 'package:listify/view/navigationBar.dart';
import 'package:listify/view/signUpPage.dart';
import 'package:listify/view/splashscreen.dart';
import 'package:listify/view/tearmsAndConditionpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UsreDataAdapter());
  Hive.registerAdapter(GroceryListDataAdapter());
  Hive.registerAdapter(GrafListDataAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
      routes: {
        'home': (context) => Homescreen(),
        'login': (context) => Loginpage(),
        'signup': (context) => Signuppage(),
        'navigation': (context) => Navigationbar(),
        'tearms': (context) => TermsAndConditionsPage(),
        'help': (context) => HelpPage(),
      },
    );
  }
}
