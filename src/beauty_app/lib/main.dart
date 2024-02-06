// import 'package:beauty_app/screens/home.dart';
import 'package:beauty_app/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kDarkColor =  ColorScheme.dark(
    primary: Color.fromARGB(255, 222, 182, 148),
    secondary: Color.fromARGB(255, 158, 127, 109));
final kBrightColor = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 251, 177, 92),
    primary: Color.fromARGB(255, 222, 138, 34),
    secondary: Color.fromARGB(255, 243, 180, 108),
    tertiary: Color.fromARGB(255, 249, 237, 225));
//define theme
final theme = ThemeData(
  useMaterial3: true,
  colorScheme: kBrightColor,
  textTheme: GoogleFonts.latoTextTheme(),
);

// define dark mode
final themeDark = ThemeData.dark().copyWith(
  colorScheme: kDarkColor,
  textTheme: GoogleFonts.latoTextTheme(),
);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: themeDark,
      title: 'Beauty App',
      theme: theme,
      home: const SignInScreen(),
      
    );
  }
}
