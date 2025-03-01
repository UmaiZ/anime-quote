import 'package:animechan/view/anime.dart';
import 'package:animechan/view/getstarted.dart';
import 'package:animechan/viewmodel/anime_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AnimeViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.dark(
            primary: Colors.purpleAccent,
            surface: Color(0XFF17181d), // Use surface instead of background
            onSurface: Colors.white, // Text color on surface
            secondary: Colors.purpleAccent,
            error: Colors.red,
          ),
          scaffoldBackgroundColor: Color(0XFF17181d), // Set scaffold background
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0XFF17181d),
            titleTextStyle: TextStyle(
              color: Colors.purpleAccent,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            iconTheme: IconThemeData(color: Colors.purpleAccent),
          ),
        ),
        home: Getstarted(),
      ),
    );
  }
}
