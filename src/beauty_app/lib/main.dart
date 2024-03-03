// import 'package:beauty_app/screens/home.dart';
import 'package:beauty_app/screens/home.dart';
import 'package:beauty_app/screens/sign_in.dart';
import 'package:beauty_app/widgets/catagogy.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kDarkColor = ColorScheme.dark(
    primary: Color.fromARGB(255, 17, 159, 246),
    onPrimary: Color.fromARGB(255, 74, 149, 196),
    secondary:  Color.fromARGB(255, 41, 83, 110));
final kBrightColor = ColorScheme.fromSeed(
    seedColor:Color.fromARGB(255, 142, 209, 252),
    primary:Color.fromARGB(255, 153, 212, 249),
    secondary: Color.fromARGB(255, 222, 240, 251),
    tertiary:Color.fromARGB(255, 200, 230, 240),
    onTertiary: Color.fromARGB(255, 133, 133, 133),
    onSecondary: Color.fromARGB(255, 144, 184, 185),
    onPrimary: Color.fromARGB(255, 22, 141, 181),

    );
  
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
      home:const HomeScreen()
    );
  }
}
