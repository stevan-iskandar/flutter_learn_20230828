import 'package:flutter/material.dart';
import 'package:flutter_learn_20230828/src/constants/now_ui_colors.dart';
import 'package:flutter_learn_20230828/src/screens/tabs_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData theme({
    required Brightness brightness,
  }) {
    return ThemeData(
      brightness: brightness,
      colorScheme: ColorScheme.fromSeed(
        brightness: brightness,
        seedColor: NowUIColors.primary,
      ),
      textTheme: GoogleFonts.montserratTextTheme(),
      useMaterial3: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(brightness: Brightness.light),
      darkTheme: theme(brightness: Brightness.dark),
      home: const TabsScreen(),
    );
  }
}
