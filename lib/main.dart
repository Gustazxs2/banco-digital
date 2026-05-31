import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Banco Gamer',
      theme: ThemeData(
        textTheme: GoogleFonts.pressStart2pTextTheme(),
        scaffoldBackgroundColor: const Color(0xFF07031A),
      ),
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
