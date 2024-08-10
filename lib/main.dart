import 'package:data_persistence/auth/login_or_register.dart';
import 'package:data_persistence/models/restaurant.dart';
import 'package:data_persistence/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      //theme provider
      ChangeNotifierProvider(create: (context) => ThemeProvider(),),
      //restaurant provider 
      ChangeNotifierProvider(create: (context) => Restaurant(),),
      
    ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home:  LoginOrRegister(),
    );
  }
}
