import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic/provider/tic_provider.dart';
import 'package:tic/screens/homepage.dart';
import 'package:tic/screens/play_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<TicProvider>(
          create: (_) => TicProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: "/",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const MyHomePage(),
        "/play": (context) => const PlayScreen(),
      },
    );
  }
}
