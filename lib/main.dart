import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smartlab/core/constants/color_constants.dart';
import 'package:smartlab/core/init/provider_list.dart';
import 'package:smartlab/screens/loginscreen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

Widget build(BuildContext context) {
  return MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: FutureBuilder(
      builder: (context, snapshot) {
        return const MyApp();
      },
      future: null,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Promote Uganda Dashboard - Admin Panel v0.1 ',
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(backgroundColor: bgColor, elevation: 0),
        scaffoldBackgroundColor: Colors.white, //bgColor,
        primaryColor: greenColor,
        dialogBackgroundColor: secondaryColor,
        // buttonColor: greenColor,
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ).apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: const Login(title: "Welcome to the Admin & Dashboard Panel",),
    );
  }
}
