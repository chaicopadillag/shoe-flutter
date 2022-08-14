import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/providers/providers.dart';
import 'package:shoes_app/screens/screens.dart';

void main() {
  return runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ShoeProvider())],
    child: ShoesApp(),
  ));
}

class ShoesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ShoeScreen(),
      ),
    );
  }
}
